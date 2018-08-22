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

### Use the local DNS server

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


:house: [Back to home](README.md)
