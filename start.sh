#!/bin/sh

j2 config.j2 > config.json

/usr/bin/mesos-dns -config=config.json