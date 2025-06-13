# Dockerfile
FROM docker.io/golang:latest

RUN apt-get update &&\
    apt-get upgrade -y &&\
    apt-get install -y apt-transport-https &&\
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg &&\
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list &&\
    apt-get update &&\
    apt-get install google-cloud-cli -y &&\
    apt-get clean

RUN curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh -o install-opentofu.sh &&\
    chmod +x install-opentofu.sh &&\
    ./install-opentofu.sh --install-method deb &&\
    rm -f install-opentofu.sh &&\
    apt-get clean

RUN mkdir -p /usr/local/bin && apt-get update && apt-get install -y unzip && curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash

RUN curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin
