<?php
/**
 * @file How to read a CSV file
 */
/*
 * Number of column
 * If the value is different of 0, we check if the file has the right
 * amount of column. If not, we throw an exception.
 */
define('CSV_NB_COL', 0);
/*
 * Values separation character
 */
define('CSV_BREAKCHAR', ';');
/*
 * Folder to scan
 */
define('CSV_FOLDER_INPUT', './');
/*
 * Do we skip the first line
 */
define('CSV_SKIP_FIRSTLINE', true);
/*
 * Execution
 */
// Check folder existance
if (!is_dir(CSV_FOLDER_INPUT)) {
    throw new Exception('The targetted folder does not exists.');
}
$directory = opendir(CSV_FOLDER_INPUT);
if ($directory) {
    // Parse every files in that folder
    while (($filename = readdir($directory)) !== false) {
        // Exclude non CSV files
        if (!is_file(CSV_FOLDER_INPUT . $filename) || strpos($filename, '.csv') === false) {
            continue;
        }
        // Current CSV file
        // Init variables
        $rowCount = 0;
        $addedCount = 0;
        $firstLine = true;
        $file = fopen(CSV_FOLDER_INPUT . $filename, 'r');
        if (!$file) {
            throw new Exception('The file "' . CSV_FOLDER_INPUT . $filename . '" cannot be read.');
        }
        // Parse every line of the current file
        while (($data = fgetcsv($file, 1000, CSV_BREAKCHAR)) !== FALSE) {
            // Check the column count
            if (CSV_NB_COL > 0 && count($data) !== CSV_NB_COL) {
                throw new Exception('The current file column count does not match the expected value.');
            }
            // Do we skip the first line (headers) ?            
            if (CSV_SKIP_FIRSTLINE && $firstLine) {
                $firstLine = false;
                continue;
            }
            // Execute the main task
            if (doMyTask($data)) {
                $addedCount++;
            }
            // File line counter
            $rowCount++;
        }
        fclose($file);
        // We can print a sum up for each file of what has been done
        print '<h2>Executed values: ' . $addedCount . '/' . $rowCount . '</h2>';
    }
    // Close directory to free memory
    closedir($directory);
}

/**
 * External treatment
 * @param type $filename
 * @param type $hData
 * @return boolean
 */
function doMyTask($data)
{
    // Do stuff here
    print '<pre>Line Values : ' . print_r($data, true) . '</pre>';
    var_export($data);
    return true;
}
