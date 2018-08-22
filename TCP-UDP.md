TCP / UDP
======

TCP
------

Nothing yet.

UDP
------

### Listen to UDP requests
```
nc -klu -p 9125
```

Options: 
* l: listen
* k: continuous listening
* p: specific port to listen
* u: force to use UDP (TCP by default)

### Send UDP requests
```
echo 'pmn_second_counter:1|c|1|#code:200,app:test' | nc -w 1 -u pp-statsd-exporter-prometheus-01.m6web.fr 9125
```



:house: [Back to home](README.md)