FROM jupyter/datascience-notebook:latest
# jupyterhub/k8s-hub

#jupyterhub/jupyterhub:latest 
#(should work with any base image from JupyterLab project) 
# jupyter/base-notebook
# Fix: https://github.com/hadolint/hadolint/wiki/DL4006
# Fix: https://github.com/koalaman/shellcheck/wiki/SC3014
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root

ENV CODE_VERSION=4.14.1
ENV JUPYTER_VERSION=latest

# Installation des paquets pour le développement
RUN apt-get update --yes && \
    apt-get install --yes --quiet --no-install-recommends \
    curl \
    iputils-ping \
	build-essential \
    make \
    cmake \
    g++ \
    clang \
    htop \
    libopencv-dev \
    && \
    apt-get --quiet clean && rm -rf /var/lib/apt/lists/*

#RUN pip install jupyter-server-proxy

# Install Code Server and server-proxy/vscode-proxy to integrate code into JupyterLab
RUN curl -fOL https://github.com/coder/code-server/releases/download/v$CODE_VERSION/code-server_${CODE_VERSION}_amd64.deb \
    && dpkg -i code-server_${CODE_VERSION}_amd64.deb \
    && rm -f code-server_${CODE_VERSION}_amd64.deb
RUN /opt/conda/bin/conda install -c conda-forge jupyter-server-proxy
RUN /opt/conda/bin/conda install -c conda-forge jupyter-vscode-proxy

# RUN code-server --install-extension oderwat.indent-rainbow


# Installation of the XFCE office and the extension of the Desktop server for a number of graphic attachments
RUN apt-get update --yes --quiet && \
    apt-get install --yes --quiet \
    dbus-x11 xfce4 xfce4-panel xfce4-session xfce4-settings xorg xubuntu-icon-theme && \
    apt-get remove --yes --quiet light-locker && \
    apt-get clean --quiet && rm -rf /var/lib/apt/lists/*
RUN /opt/conda/bin/conda install -c manics websockify && \
    pip install git+https://github.com/yuvipanda/jupyter-desktop-server.git

# Switch back to jovyan to avoid accidental container runs as root
USER ${NB_UID}