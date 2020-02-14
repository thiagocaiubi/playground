# Ansible

Docker image for ansible

## Prerequisites

 - [GNU Make](https://www.gnu.org/software/make/)
 - [Docker](https://www.docker.com/)

## Build image

```console
make image
```

## Create foo.txt file with ansible inside the container

Start interactive shell session inside the container

```console
make shell
```

```console
ansible-playbook foo.yml
```

Check the file

```console
ls -l /tmp
```
