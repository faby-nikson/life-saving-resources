<?php

/**
 * @file File and folder handling
 * Play with files and folders
 */

/**
 * Variables
 */
$dir = getcwd();
$newFolder = $dir . '/_new-folder';
$newFile = $newFolder . '/' . '_new-file.txt';

/*
 * Step 1 : try to create folder
 */
print '<h2>Attempts to create folder: ' . $newFolder . '</h2>';
if (!is_dir($newFolder)) {
    $folderCreated = mkdir($newFolder);
    print '<h3>- Folder creation result: ' . print_r($folderCreated, true) . '</h3>';
} else {
    print '<h3>- Folder already exists</h3>';
}

/*
 * Step 2 : try to create a file and write into it
 */
print '<h2>Attempts to create file: ' . $newFile . '</h2>';
$fileHandler = fopen($newFile, 'a+');
print '<h3>- File creation result: ' . print_r($fileHandler, true) . '</h3>';
$fileWritable = fwrite($fileHandler, 'add some data into the file' . PHP_EOL);
print '<h3>- File writing result: ' . print_r($fileWritable, true) . '</h3>';
print '<h3>- File POSIX is_writable() result: ' . print_r(is_writable($newFile), true) . '</h3>';
fclose($fileHandler);

/*
 * Step 3 : Remove the file
 */
print '<h2>Attempts to remove file: ' . $newFile . '</h2>';
if (file_exists($newFile)) {
    $fileRemoved = unlink($newFile);
    print '<h3>- File deletion result: ' . print_r($fileRemoved, true) . '</h3>';
}

/*
 * Step 4 : remove the folder
 */
print '<h2>Attempts to remove folder: ' . $newFolder . '</h2>';
if (is_dir($newFolder)) {
    print '<h3>- Folder POSIX rights: ' . print_r(substr(sprintf('%o', fileperms($newFolder)), -4), true) . '</h3>';
    // Change Folder right if we can/need
    //$folderRightsChanged = chmod($newFolder, 0755);
    //print '<h3>- Folder POSIX rights changed: ' . print_r($folderRightsChanged, true) . '</h3>';
    //print '<h3>- Folder POSIX rights: ' . print_r(substr(sprintf('%o', fileperms($newFolder)), -4), true) . '</h3>';
    $folderRemoved = rmdir($newFolder);
    print '<h3>- Folder deletion result: ' . print_r($folderRemoved, true) . '</h3>';
}