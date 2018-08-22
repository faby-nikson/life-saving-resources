<?php

/**
 * @file Log execution times
 * Useful for a temporary debug
 */
/*
 * Define constants and globals so we can 
 * access those variables from everywhere
 */
define('DEBUG_LOGPATH', './logs/log-time-' . date('ymd') . '.log'); // @TODOACTI : debug : log execution time 
global $t; // @TODOACTI : debug : log execution time 
$t = microtime(true); // @TODOACTI : debug : log execution time 
error_log('--- New test ---' . PHP_EOL, 3, DEBUG_LOGPATH); // @TODOACTI : debug : log execution time 
/*
 * Lines to copy/paste averywhere we need it
 */
global $t; // @TODOACTI : debug : log execution time 
error_log('Time before : ' . round(microtime(true) - $t, 4) . PHP_EOL, 3, DEBUG_LOGPATH); // @TODOACTI : debug : log execution time 

/*
 * Big and complex functions
 */
sleep(1);

/*
 * Lines to copy/paste averywhere we need it
 */
global $t; // @TODOACTI : debug : log execution time 
error_log('Time after : ' . round(microtime(true) - $t, 4) . PHP_EOL, 3, DEBUG_LOGPATH); // @TODOACTI : debug : log execution time 