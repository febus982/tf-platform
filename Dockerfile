FROM hashicorp/terraform:0.12.29

RUN mkdir -p /platform
WORKDIR /platform