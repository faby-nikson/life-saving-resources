<?php

/**
 * @file Log execution time with FirePHP
 */
require_once('firephp/fb.php'); // @TODOACTI : debug : time : firephp inclusion
global $t; // @TODOACTI : debug : time : microtime global declaration
$t = microtime(true); // @TODOACTI : debug : time : microtime init

FB::log('Time ___: ' . round(microtime(true) - $t, 4)); // @TODOACTI : debug : time : microtime log

/*
 * beggining of complex PHP script
 */
sleep(1);
/*
 * end of complex php script
 */

FB::log('Time ___: ' . round(microtime(true) - $t, 4)); // @TODOACTI : debug : time : microtime log

