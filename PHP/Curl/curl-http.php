<?php

/**
 * @file Simple HTTP Request
 */
// HTTP URL to call
$sUrl = 'http://www.acti.fr';
// Init curl resource
$curl = curl_init();
// Set up options
$hCurloptions = array(
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_HEADER => false,
    CURLOPT_VERBOSE => true,
    CURLOPT_URL => $sUrl,
    CURLINFO_HEADER_OUT => true,
    CURLOPT_TIMEOUT => 5,
    CURLOPT_FOLLOWLOCATION => true,
);
curl_setopt_array($curl, $hCurloptions);
// Execute the curl command and get the return if
// the option CURLOPT_RETURNTRANSFER is set to true
// Otherwse, the request won't return anything
$return = curl_exec($curl);
// Get Header Informations
$infos = curl_getinfo($curl);
// Display debug data
echo '<pre> ' . print_r($return, true) . '</pre>';
echo '<pre> ' . print_r($infos, true) . '</pre>';
die();
