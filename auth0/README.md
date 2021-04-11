# auth0

Export/Import tenant configuration.

## Prerequisites

 - [GNU Make](https://www.gnu.org/software/make/)
 - [Docker](https://www.docker.com/)
 - [Auth0](https://auth0.com/) tenant account

Make sure to configure a Auth0 client to access management API.
See [Create the Deploy CLI Application](https://auth0.com/docs/extensions/deploy-cli-tool/install-and-configure-the-deploy-cli-tool#create-the-deploy-cli-application).

## Build image

```console
make image
```

## Export/Import auth0 tenant configuration

Copy [config.json.example](./config.json.example) to `config.json` and replace
values with your configuration.

```console
make export
```

```console
make import
```

## Start interactive shell session inside the container

Run any other a0deploy command inside the container.

```console
make shell
```
