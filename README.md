## GitHub Action Runner


#### **Base Docker Image**

* ubuntu:18.04

#### **Download and extract runner package**

```shell
curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz
tar xzf ./actions-runner-linux-x64-2.288.1.tar.gz
```
> Update the `RUNNER_VERSION` variable with the latest version of the runner, which can be found [here](https://github.com/actions/runner/releases).

#### **Base Docker Image**

* ubuntu:18.04
