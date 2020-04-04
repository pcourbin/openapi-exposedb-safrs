# Docker to use [OpenAPI-ExposeDB-SAFRS](https://github.com/thomaxxl/safrs/tree/master/expose_existing)
This work is based on the great work of [thomaxxl](https://github.com/thomaxxl) on [SAFRS](https://github.com/thomaxxl/safrs) (SqlAlchemy Flask-Restful Swagger Json-API OpenAPI).

Docker image to deploy [SAFRS-ExposeDB](https://github.com/thomaxxl/safrs/tree/master/expose_existing) and expose a live SQL database using a generated API with OpenAPI/Swagger documentation.

This docker image is based on [python:3-alpine](https://hub.docker.com/_/python).
It includes the packages needed to run [SAFRS-ExposeDB](https://github.com/thomaxxl/safrs/tree/master/expose_existing).

  * [Getting Started](#getting-started)
    + [Prerequisities](#prerequisities)
    + [Quickstart](#quickstart)
  * [Environment Variables](#environment-variables)

## Getting Started

### Prerequisities

In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

### Quickstart

To run a full functional version, you can use the file `docker-compose.yml`.

```
version: '3'
services:
  safrs-expose_existing:
    image: pcourbin/openapi-exposedb-safrs:2.7.0
    environment:
      - DB_HOST=db.serveur.fr # Do not define if the DB is accessible on your docker host
      - DB_PORT=3306
      - DB_NAME=mydbname
      - DB_USER=user
      - DB_PASSWORD=password
      - PORT=3000
    ports:
      - 3000:3000
```
and run
```
docker-compose -f docker-compose.yml up
```
Then, go to http://localhost:3000/api to see your generated API for your SQL database.

If it does not work, see
```
docker-compose -f docker-compose.yml logs -f
```

## Environment Variables

| Name | Default value | Description |
| --- | --- |--- |
| `DB_HOST` | Docker host ip if variable not defined | Host of your sql database. **If your database is on your docker host, do not define this variable.** |
| `DB_PORT` | `3306` | Port of your sql database link with `DB_HOST`.  |
| `DB_NAME` | `mydb` | Database name. |
| `DB_USER` | `user` | Username with access to your sql database. |
| `DB_PASSWORD` | `password` | Password linked with `DB_USER`. |
| `PORT` | `3000` | Port where the API will be deployed inside the docker. **Define the same PORT on your host and on the API inside the docker to be able to test it using the OpenAPI GUI** |
