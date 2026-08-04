import Meta from 'gi://Meta';
import Shell from 'gi://Shell';

import * as Main from 'resource:///org/gnome/shell/ui/main.js';
import {Extension} from 'resource:///org/gnome/shell/extensions/extension.js';

const SWAP_KEY = 'swap-monitors';

const MOVABLE_TYPES = [
    Meta.WindowType.NORMAL,
    Meta.WindowType.DIALOG,
    Meta.WindowType.MODAL_DIALOG,
];

function isMovable(window) {
    if (window.is_skip_taskbar())
        return false;

    if (!MOVABLE_TYPES.includes(window.get_window_type()))
        return false;

    // Transient children follow their parent across monitors on their own.
    // Moving them separately would fight mutter's own repositioning.
    return window.get_transient_for() === null;
}

export default class SwapMonitorWindowsExtension extends Extension {
    enable() {
        this._settings = this.getSettings();

        Main.wm.addKeybinding(
            SWAP_KEY,
            this._settings,
            Meta.KeyBindingFlags.IGNORE_AUTOREPEAT,
            Shell.ActionMode.NORMAL,
            () => this._swapMonitors()
        );
    }

    disable() {
        Main.wm.removeKeybinding(SWAP_KEY);
        this._settings = null;
    }

    // Which two screens to exchange. With exactly two it is unambiguous; beyond
    // that, pair the primary with wherever the user is currently working.
    _pickMonitors() {
        const display = global.display;
        const count = display.get_n_monitors();

        if (count < 2)
            return null;
        if (count === 2)
            return [0, 1];

        const primary = display.get_primary_monitor();
        const focused = display.focus_window?.get_monitor() ?? display.get_current_monitor();
        const other = focused === primary ? (primary + 1) % count : focused;

        return [primary, other];
    }

    _collectWindows() {
        const wm = global.workspace_manager;

        const workspaces = this._settings.get_boolean('all-workspaces')
            ? Array.from({length: wm.get_n_workspaces()}, (_, i) => wm.get_workspace_by_index(i))
            : [wm.get_active_workspace()];

        // With workspaces-only-on-primary (the GNOME default), windows on a
        // secondary screen are on every workspace, so they appear in more than
        // one list. A Set keeps each window once.
        const windows = new Set();
        for (const workspace of workspaces) {
            if (!workspace)
                continue;
            for (const window of workspace.list_windows()) {
                if (isMovable(window))
                    windows.add(window);
            }
        }

        return [...windows];
    }

    _swapMonitors() {
        const monitors = this._pickMonitors();
        if (!monitors) {
            console.debug('swap-monitor-windows: needs at least two screens');
            return;
        }

        const [a, b] = monitors;

        // Resolve every destination before moving anything. Moving as we go
        // would re-examine windows that already crossed over and send them back.
        const moves = [];
        for (const window of this._collectWindows()) {
            const monitor = window.get_monitor();
            if (monitor === a)
                moves.push([window, b]);
            else if (monitor === b)
                moves.push([window, a]);
        }

        if (moves.length === 0) {
            console.debug(`swap-monitor-windows: no windows on screens ${a} and ${b}`);
            return;
        }

        // move_to_monitor() carries maximized, tiled and fullscreen states over
        // and rescales geometry when the two screens differ in size.
        for (const [window, monitor] of moves)
            window.move_to_monitor(monitor);

        console.debug(
            `swap-monitor-windows: swapped ${moves.length} window(s) between screens ${a} and ${b}`);
    }
}
