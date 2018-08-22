<?php

/**
 * @file Log into a dedicated file
 * Usefull for a long term log.
 */
// Data to log
$data = array(
    'key1' => 'value1',
    'key2' => 'value2',
    'key3' => 'value3',
);
// Path variables 
$logPath = './logs/log-file-' . date('ymd') . '.log';
// Set the debug value
$logValue = str_replace("\n", '', print_r($data, true));
// Build the message
$message = date('Y-m-d H:i:s :: ') . 'custom log :: ' . $logValue . PHP_EOL;
// Log the message
error_log($message, 3, $logPath);
