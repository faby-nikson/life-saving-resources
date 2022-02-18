# Docker

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Install](#install)
- [Commands](#commands)
- [Docker Compose](#docker-compose)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Install

First of all, you need to [install docker](https://www.docker.com/products/docker-engine)
 and [docker-compose](https://docs.docker.com/compose/) on your computer.
 
## Commands

Run an image:
```
Docker run
```

List running containers:
```
docker ps
```

Retrouver l'ip d'une machine / d'un container
```
docker inspect [nom_du_container]
```

Stopper tous les processus
```
docker kill $(docker ps -q)
```

Rentrer dans le bash d'un container
```
docker exec -i -t [container_name] /bin/bash
docker exec -i -t [container_name] /bin/bash
``` 


## Docker Compose

Build
```
docker-compose build
```

Lancement:
``` 
docker-compose up -d
```

Voir les containers qui tournent
```
docker-compose ps
``` 

Retrouver ip de docker
```
docker-machine ip
``` 

Resources examples: [Resources examples](resources/docker/) 
