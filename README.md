# Golang & Dep (Alpine based Docker Image)

This image is intended for building - testing Golang apps which uses vendoring packages handled by Dep dependency manager.

## Paths

By default, **GOPATH** is located under /go directory

## How shoud I use the image

Once you have your source code available under your current directory, you should specify a volume mapping to the docker image to the `/go/src/app` directory.

Then your code will be available in the previous path, which is inside the $GOPATH, so running `dep ensure` shouldn't cause any errors related with paths bad configurations.

### Docker Volume Binding

```bash
docker run -ti -v $(pwd):/go/src/app tenrero/golang-dep-alpine
```

### Jenkins Declarative Pipeline

```Jenkinsfile
pipeline {
    agent {
        docker {
            image 'tenrero/golang-dep-alpine'
            reuseNode true
            args '-v $WORKSPACE:/go/src/app'
        }
    }

    stages {

    }
}
```

## Docker-In-Docker

Just mount the Docker Socket

`-v /var/run/docker.sock:/var/run.docker.sock`