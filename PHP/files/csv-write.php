<?php

/**
 * @file How to write into a CSV file
 */
/*
 * Output file path
 */
define('CSV_FOLDER_OUTPUT', './_example.csv');

/*
 * Main data
 */
$data = array();
$data[] = array(0 => 'Header1', 1 => 'Header2', 2 => 'Header3',);
$data[] = array(0 => 'Value1', 1 => 'Value2 with specials\' v@alues "yeah!"', 2 => 'Value 3, with lots of text',);
$data[] = array(0 => 'Loremp ipsum', 1 => 'Hey', 2 => 'Same Value 3, with lots of text',);
/*
 * Execution
 */
// open the main file in writing mode
$file = fopen(CSV_FOLDER_OUTPUT, 'w');
// parse our values
if (!empty($data)) {
    foreach ($data as $row) {
        // Put every line into the CSV
        // We send an array where every items match with a column.
        fputcsv($file, $row);
    }
}
