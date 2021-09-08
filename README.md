## k8s data feed

Container based application for K8S Calculator

### Prerequirements

- Docker
- Docker Compose
- AWS Cli
- Google SDK
- Azure SDK

### Setup Credentials

- AWS Credentials
  ```
  aws configure
  ```
- GCP Credentials

  ```
  gcloud auth login
  ```

- Azure Credentials

  ```
  az login
  ```

## Build Container

- Running Docker Compose
  ```bash
  ./run-docker.sh
  -- or --
  docker-compose -f docker/app-compose.yml up -d
  -- or --
  make run
  ```

## Remove Container

- Running Docker Compose
  ```bash
  docker-compose -f docker/app-compose.yml down
  -- or --
  make remove
  ```

## Running Port

- Non HTTPS (80) -> 5050
- HTTPS (443) -> 5051

## Tested Environment

### Versioning

- Docker version
  ```
  Client:
    Cloud integration: 1.0.17
    Version:           20.10.8
    API version:       1.41
    Go version:        go1.16.6
    Git commit:        3967b7d
    Built:             Fri Jul 30 19:55:20 2021
    OS/Arch:           darwin/amd64
    Context:           default
    Experimental:      true
  ```
- Docker-Compose version
  ```
  docker-compose version 1.29.2, build 5becea4c
  docker-py version: 5.0.0
  CPython version: 3.9.0
  OpenSSL version: OpenSSL 1.1.1h  22 Sep 2020
  ```

## Copyright

- Modified: **Dwi Fahni Denni (@zeroc0d3)**
- License: **MIT**
