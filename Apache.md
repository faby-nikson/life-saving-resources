Apache
======

.htaccess
------

```apache

<IfModule mod_rewrite.c>

    # Force the rewrite engine to be activated
    RewriteEngine on

    # // @TODOACTI : redirection examples
    #RewriteBase /

    #####################################
    # _____ Simple redirection/rewriting _____
    #####################################

    # Redirection with a host test : Everything starting with /en
    RewriteCond %{HTTP_HOST} ^isit-paris.fr$ [NC]
    RewriteRule ^en/(.*)$ http://isitinternational.com/en/$1 [R=301,L,NC]
    # Redirection with a host test : Everything starting without /en
    RewriteCond %{HTTP_HOST} ^isitinternational.comlma$ [NC]
    RewriteRule ^(?!en/)(.*)$ /en [R=301]
    # Simple rewriting examples
    RewriteRule ^en$ / [L,NC]
    RewriteRule ^en(.*)  $1 [R,L,NC]
    # Redirect request except specified files
    RewriteCond %{REQUEST_FILENAME} !(gif|png|css|js)$
    RewriteRule ^(.+)$ http://cpe-lyon.mobi [R=301,L]
    # SSL redirection
    RewriteCond %{HTTPS} !=on
    RewriteRule .* https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]

    #####################################
    # _____ Advanced redirection _____
    #####################################


    #####################################
    # _____ Simple authentication _____
    #####################################

    AuthName "Restricted Area"
    AuthType Basic
    AuthGroupFile /dev/null
    AuthUserFile /mnt/Projets/.htpasswd
    require valid-user

    #####################################
    # _____ Advanced authentication _____
    #####################################


    #####################################
    # _____ Simple maintenance page _____
    #####################################

    # IPs to authorize
    # In some servers, REMOTE_ADDR can be removed (Eolas with Varnish for example)
    # So we can use alternative fields like {HTTP:X-FORWARDED-FOR}
    RewriteCond %{REMOTE_ADDR} !109.190.133.54
    RewriteCond %{REMOTE_ADDR} !82.225.63.197 
    RewriteCond %{REMOTE_ADDR} !109.7.99.130
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteRule .* - [E=AUTHIPREDIRECT:true]
    # If we already are on the target, we do nothing
    RewriteRule maintenance.html - [L]
    # Otherwise, we redirect anyone else (except specified IPs)
    RewriteCond %{ENV:AUTHIPREDIRECT} ^true$
    RewriteRule .* /maintenance.html [L]

    #####################################
    # _____ Simple waiting page _____
    #####################################

    # IP to authorize : save into an environment variable
    RewriteCond %{REMOTE_ADDR} !127.0.0.1
    RewriteCond %{REMOTE_ADDR} !127.0.0.2
    RewriteRule .* - [E=AUTHIPREDIRECT:true]
    # Already on waiting page : we do nothing
    RewriteRule _waiting-page/.* - [L]
    # Rewrite every request (not html) on waiting page
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{ENV:AUTHIPREDIRECT} ^true$
    RewriteRule (.+)(?!html)$ _waiting-page/$1$2 [L]
    # Redirect every other request on waiting html main page
    RewriteCond %{ENV:AUTHIPREDIRECT} ^true$
    RewriteRule ^ /_waiting-page/index.html [L]

    #####################################
    # _____ Advanced maintenance/waiting page _____
    #####################################


</IfModule>
```

.htpasswd
------
```
login:pass
```



:house: [Back to home](../../)