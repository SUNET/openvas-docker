OpenVAS / Greenbone Docker containers
=====================================

OpenVAS / Greenbone docker containers based on the packages included
in Kali, but rebuilt for Ubuntu 14.04 and tweaked to fit our use case.
Since libmicrohttpd is quite limited in functionality, both security wise
and when it comes to support for functionality such as authentication, it
is recommended that you run e.g. a Nginx container in front of Greenbone.

Building
--------

```
make build
```

Updating
-----

```
make update
```

Pushing
-----

```
make push
```

