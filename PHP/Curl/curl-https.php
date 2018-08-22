<?php

/**
 * @file Simple HTTPS Request
 */
// HTTP URL to call
$app_id = '859132110871148';
$app_secret = '29e1701f48d39b88a1cde8dfdd4371ac';
$access_token = 'f08ede38d3e720a57994550d5b49980a';
$appsecret_proof = hash_hmac('sha256', $access_token, $app_secret);
$sUrl = "https://graph.facebook.com/oauth/access_token?"
        . "client_id=" . $app_id
        . "&client_secret=" . $app_secret
        . "&grant_type=client_credentials";
// Init curl resource
$curl = curl_init();
// Set up options
$hCurloptions = array(
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_HEADER => false,
    CURLOPT_VERBOSE => true,
    CURLOPT_URL => $sUrl,
    CURLINFO_HEADER_OUT => true,
    CURLOPT_SSL_VERIFYPEER => false,
    CURLOPT_TIMEOUT => 5,
    CURLOPT_FOLLOWLOCATION => true,
);
curl_setopt_array($curl, $hCurloptions);
// Execute the curl command and get the return if
// the option CURLOPT_RETURNTRANSFER is set to true
// Otherwse, the request won't return anything
$return = curl_exec($curl);
// Get Header debug Informations
$infos = curl_getinfo($curl);
// Display data
echo '<pre> ' . print_r($return, true) . '</pre>';
echo '<pre> ' . print_r($infos, true) . '</pre>';
die();
