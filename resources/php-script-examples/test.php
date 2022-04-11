<?php
/**
 * @file A file called test.php might be usefull
 */
// Display errors
error_reporting(E_ALL);
ini_set("display_errors", 1);

// Get current url
$current_url = "http://" . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
print $current_url . '<br>';

// Get Root Path
//define('SITE_ROOT', dirname(__FILE__)); // Old-way
define('SITE_ROOT', getcwd());
print   SITE_ROOT;
