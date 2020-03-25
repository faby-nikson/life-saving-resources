# PhpStorm

## Live Templates

You can download the settings here: [PhpStorm-live-templates-settings.zip](./PhpStorm-live-templates-settings.zip)

Here is the description of the shortcuts:

### General templates

| Template | Result |
--------
| **code** | Paste the clipboard and surrounds it with \`\`\`$CLIPBOARD$\`\`\` |

### PHP Templates

| Template | Description | Result |
--------
| **a** | Debug | `print_r($CLIPBOARD$); die(); // @todo: debug backtrace` |
| **apre** | Debug | `print '<pre>' . print_r($CLIPBOARD$, true) . '</pre>'; die(); // @todo: debug backtrace` |
| **q** | Debug | `die('here.'); // @todo: debug backtrace` |
| **t** | Todo | `// @todo: ` |
| **z** | Debug | `var_dump($CLIPBOARD$); // @todo: debug backtrace` |
| **zz** | Debug | `var_dump($CLIPBOARD$); die(); // @todo: debug backtrace` |

### PHP Templates: Symfony

| Template | Result |
--------
| **c** | `$output->writeln('<info>$SELETION$</info>');` |
| **d** | `dump($CLIPBOARD$);die(); // @todo: debug backtrace` |
| **dd** | `dump($CLIPBOARD$);die(); // @todo: debug backtrace` |
| **vd** | `\Symfony\Component\VarDumper\VarDumper::dump($CLIPBOARD$); // @todo: debug backtrace` |

### Javascript templates

| Template | Result | Description |
--------
| **co** | `console.log('(i) Debug Info: ' + $CLIPBOARD$);` | Javascript |
| **coe** | `console.log("/!\\ ERROR: : " + $CLIPBOARD$);` | Javascript |
