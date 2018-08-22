<?php

/**
 * @file test if a curl target is redirected
 */
// The option CURLOPT_FOLLOWLOCATION ask curl to follow redirections.
// So if we want to check a specific URL, sometines we don't check the origin
// but the redirected result.
// --
// CURLOPT_FOLLOWLOCATION is set up to true as a default value
// -- 
// In this example we aim a 301 redirection
// http://acti.fr => http://www.acti.fr
// So if we want to check the statuts code of the first URL, we have to 
// force CURLOPT_FOLLOWLOCATION to false.
$sUrl = 'http://acti.fr';
$curl = curl_init();
$hCurloptions = array(
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_HEADER => false,
    CURLOPT_VERBOSE => true,
    CURLOPT_URL => $sUrl,
    CURLINFO_HEADER_OUT => true,
    CURLOPT_TIMEOUT => 5,
    CURLOPT_FOLLOWLOCATION => false,
);
curl_setopt_array($curl, $hCurloptions);
$return = curl_exec($curl);
$infos = curl_getinfo($curl);
curl_close($curl);
echo '<pre> ' . print_r($return, true) . '</pre>';
echo '<pre> ' . print_r($infos, true) . '</pre>';
// So we can test the returned status in order to 
// manage cases differently
switch ($infos['http_code']) {
    // Redirection 301 found
    case 301:
        // Do something specific here.
        print '301 FOUND';
        break;
    case 404:
        // Do something with that.
        break;
}

