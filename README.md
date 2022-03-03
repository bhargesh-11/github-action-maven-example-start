# GitHub Action Runner

### **Dockerfile**

**Base Docker Image**
```shell
FROM ubuntu:18.04
```

**Runner Version**
```shell
ARG RUNNER_VERSION="2.287.1"
```
> Update the `RUNNER_VERSION` variable with the latest version of the runner, which can be found [here](https://github.com/actions/runner/releases).

**Update the base packages and add a non-sudo user**
```shell
RUN apt-get update -y && useradd -m ubuntu
```

**Install docker, maven and other dependencies**
```shell
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    curl apt-utils net-tools build-essential libssl-dev libffi-dev python3 python3-venv python3-dev python3-pip \
    apt-transport-https ca-certificates software-properties-common gpg-agent

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - 2>&1 \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

RUN apt update -y \
    && apt install -y docker-ce \
    && apt install -y maven
```

**Download and extract runner package**
```shell
RUN cd /home/ubuntu && mkdir actions-runner && cd actions-runner \
    && curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && chown -R ubuntu ~ubuntu && /home/ubuntu/actions-runner/bin/installdependencies.sh
```

**Copy cofiguration script for runner**
```script
COPY start.sh start.sh
```

**Switch to non-root user**
```script
USER ubuntu
```

**Set executables that will always run when the container is initiated.**
```shell
ENTRYPOINT ["./start.sh"]
```

### start.sh


