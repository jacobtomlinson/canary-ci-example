# Container Canary CI Example

This repo shows an example of building a container and validating it using [Container Canary](https://github.com/NVIDIA/container-canary) in GitHub Actions.

- [app.py](app.py) contains our application code.
- [Dockerfile](Dockerfile) contains our container image specification.
- [canary-validator.yaml](canary-validator.yaml) contains our validation specification.
- [.github/workflows/ci.yaml](.github/workflows/ci.yaml) contains our GitHub Actions configuration.

To use Container Canary in CI you need to install it, build an image and run `canary validate`.

```yaml
name: ci

on:
  push:
  pull_request:

jobs:
  canary:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2

      - name: Install Container Canary
        run: |
          curl -L https://github.com/NVIDIA/container-canary/releases/download/v0.2.1/canary_linux_amd64 > /usr/local/bin/canary
          chmod +x /usr/local/bin/canary

      - name: Build Container
        run: docker build -t foo/canary-ci-example:latest .

      - name: Validate container
        run: canary validate --file canary-validator.yaml foo/canary-ci-example:latest
```
