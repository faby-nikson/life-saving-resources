<?php
/**
 * @file Debug example with FirePHP
 */
require_once('firephp/fb.php');

// Examples
 FB::log('Log message');
 FB::info('Info message');
 FB::warn('Warning message');
 FB::error('Error message');
?>
<!doctype html>
<!--[if lte IE 8]>
<html lang="fr" class="no-js lt-ie10 lt-ie9"> <![endif]-->
<!--[if IE 9]>
<html lang="fr" class="no-js lt-ie10"> <![endif]-->
<!--[if gt IE 9]><!-->
<html lang="fr" class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="UTF-8">
        <title>title - acti</title>
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="/_app/tpl/img/icons/favicon.ico">
        <link rel="stylesheet" href="/_app/tpl/css/bootstrap.min.css">
        <link rel="stylesheet" href="/_app/tpl/css/styles.css">
    </head>
    <body class="body-default">
        <div class="container">
            <h1>
                <img width="80" class="logo" alt="logo acti" src="/_app/tpl/img/logo.png">
                Test de Firephp
            </h1>
            
            <div class="panel panel-default">
                <div class="panel-heading">
                    Simple message
                </div>
                <div class="panel-body">
                    FB::log('Log message');
                </div>
            </div>

            <div class="panel panel-info">
                <div class="panel-heading">
                    Info message
                </div>
                <div class="panel-body">
                     FB::info('Info message');
                </div>
            </div>

            <div class="panel panel-warning">
                <div class="panel-heading">
                    Warning message
                </div>
                <div class="panel-body">
                     FB::warn('Warning message');
                </div>
            </div>

            <div class="panel panel-danger">
                <div class="panel-heading">
                    Error message
                </div>
                <div class="panel-body">
                     FB::error('Error message');
                </div>
            </div>
    </body>
</html>
