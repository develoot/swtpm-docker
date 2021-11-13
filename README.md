# swtpm-docker

## Usage

```
# Reference emulator.

docker build --tag ibmtpm ./ibmtpm-docker
docker run --net=host --name ibmtpm ibmtpm

export TPM2TOOLS_TCTI="mssim:port=2321"
```

```
docker build --tag swtpm ./swtpm-docker
docker run --net=host --name swtpm swtpm

export TPM2TOOLS_TCTI="swtpm:port=2321"
```
