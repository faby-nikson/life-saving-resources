<?php
/**
 * @file Log into Apache Error Log
 * Usefull for a temporary log.
 */
// Data to log
$data = array(
    'key1' => 'value1',
    'key2' => 'value2',
    'key3' => 'value3',
);
// Log line that you can use for temporary tests.
error_log('Custom log: ' . str_replace("\n", '', print_r($data, true))); // @TODOACTI : debug : log into apache error log