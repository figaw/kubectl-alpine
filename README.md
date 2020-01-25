# kubectl in alpine

## Build

```shell
./build.sh
```

## Run

```shell
docker run --rm -it figaw/kubectl-alpine version
```

With a kubeconfig and appliation credentials from
[figaw/cloud-sdk](https://github.com/figaw/cloud-sdk)

```shell
docker run --rm -it \
    -v kubeconfig:/root/.kube \
    -e GOOGLE_APPLICATION_CREDENTIALS=/root/.kube/google-application-credentials.json \
    figaw/kubectl-alpine version
```

## Alias

```shell
alias kubectl='docker run --rm -it \
    -e GOOGLE_APPLICATION_CREDENTIALS=/root/.kube/google-application-credentials.json \
    -v kubeconfig:/root/.kube \
    -v "$PWD":/mnt/kubectl \
    -w /mnt/kubectl \
    figaw/kubectl-alpine'
```
