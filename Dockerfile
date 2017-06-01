FROM centos:7

# Get nodejs repos
RUN curl --silent --location https://rpm.nodesource.com/setup_7.x | bash -

RUN yum -y -q update && \
    yum -y -q remove iputils && \
    yum -y -q install wget epel-release openssl openssl-devel tar unzip \
              libffi-devel python-devel redhat-rpm-config git-core \
              gcc gcc-c++ make zlib-devel pcre-devel ca-certificates \
              ruby rubygemsi nodejs && \
    yum -y -q clean all

RUN mkdir /app
COPY ./ /app
WORKDIR /app
run npm install
run npm run assets
cmd npm start
