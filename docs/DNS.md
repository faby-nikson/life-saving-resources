<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [DNS](#dns)
  - [Local DNS](#local-dns)
    - [DNS MASQ](#dns-masq)
    - [Use the local DNS server](#use-the-local-dns-server)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

DNS
======


Local DNS
------

### DNS MASQ

Download:
```
sudo apt-get install dnsmasq
```

Create the config file:
```
/etc/dnsmasq.d/local.conf
```

Add this line:
```
address=/.dev.acti/127.0.0.1
```

Restart:
```
sudo service dnsmasq restart
```

### Use the local DNS server

Edit the file:
```
/etc/dhcp/dhclient.conf
```

And add this line:
```
prepend domain-name-servers 127.0.0.1;
```

Apply:
```
sudo dhclient
```


:house: [Back to home](../../)
