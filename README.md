# JupyterHub Server Image

[![Docker Image](https://img.shields.io/docker/pulls/seblum/jupyterhub-server-image.svg)](https://hub.docker.com/r/seblum/jupyterhub-server-image)

This repository contains a Dockerfile to build a custom JupyterHub server image that includes Jupyter Server Proxy. The image enables seamless integration between Jupyter Data Science notebooks and Visual Studio Code.

## Features

- Custom JupyterHub server image with Jupyter Server Proxy
- Enables Jupyter Data Science notebooks and Visual Studio Code integration
- Container image available on DockerHub Registry for easy deployment

## Docker Image

The container image is available on DockerHub Registry. You can pull the pre-built image using the following command:

```bash
docker pull seblum/jupyterhub-server-image:latest
```

## How to Use
1. Pull the Docker image from the DockerHub Registry as described above.
2. Deploy the JupyterHub server using the Docker image. Customize the deployment according to your environment requirements.
3. Access Jupyter Data Science notebooks and seamlessly switch to Visual Studio Code environments using Jupyter Server Proxy.

## Contributions
Contributions to this project are welcome! If you have any ideas or improvements, feel free to open an issue or submit a pull request.

## License
This project is licensed under the MIT License. Feel free to use, modify, and distribute the code as needed.
