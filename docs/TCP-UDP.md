# TCP / UDP


> :warning: Not up to date


<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [TCP](#tcp)
- [UDP](#udp)
  - [Listen to UDP requests](#listen-to-udp-requests)
  - [Send UDP requests](#send-udp-requests)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


TCP
------

Nothing yet.

UDP
------

### Listen to UDP requests

```
nc -klu -p 9125
```

Options: 
* l: listen
* k: continuous listening
* p: specific port to listen
* u: force to use UDP (TCP by default)

### Send UDP requests

```
echo 'pmn_second_counter:1|c|1|#code:200,app:test' | nc -w 1 -u my-server.test.fr 9125
```
