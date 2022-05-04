# aforms2web

This project

* create a Docker image of the Formserver
* has a Helm chart for deploying the Formserver to Kubernetes

## Contents

* Overlay files for Docker
* Dockerfile for building docker images
  * Formserver
* Helm chart for formserver
* Helm configurations for deploying
  * Postgres
  * Formserver
* deployment Script that deploys everything

## Features

* Exploded WAR File
* Persistent volume for AFS data
* Init container to preload AFS data directory
  * Currently using a dedicated Docker image
  * Directly load from a git Repository
* Health checks
* Autoscaling
* Multiple replicas using shared volume of type ReadWriteMany
* Database resources can be configured via Helm
* Postgres JDBC driver included in image, other can be added easily
* The context /formservef can be renamed to anything else

## TODO

* Multiple databases
  * Libs
  * Configuration samples
