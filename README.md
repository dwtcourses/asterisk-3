<img src="https://static.scorpio-interactive.com/md/logo/sorpioint-asterisk.svg" alt="Asterisk Image logo" width="100%" height="100">

___
# Asterisk Image
Clean Asterisk image by [Scorpio Interactive](https://www.scorpio-interactive.com)  
Optimized for Europe (French) and North America

## Versioning
All notable changes to this project will be documented in [CHANGELOG.md](CHANGELOG.md).  
We use [SemVer](https://semver.org/spec/v2.0.0.html) for versioning. For the versions available, see the [tags on this repository](https://git.scorpio-interactive.com/open-source/asterisk/tags).

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

```
Git
Docker
Docker-compose (optionnal)
```

### Build and execute

1. Build the image
  * Build the project directly from git
  ```bash
  docker build  https://git.scorpio-interactive.com/open-source/asterisk.git#master:asterisk -t  asterisk
  ```

  * Build the project from the source
  ```bash
  git clone https://git.scorpio-interactive.com/open-source/asterisk.git
  cd asterisk/
  docker build -t asterisk:master ./asterisk/
  ```

1. Pull the image

  * From Scorpio Interactive registry
  ```
  docker pull registry.scpio.net:/open-source/asterisk:master
  ```
  * From Docker Cloud
  ```
  docker pull scorpioint/asterisk
  ```


1. Run the image

  * With docker run

  ```bash
  docker run --name my_asterisk \
  -v "full_path/to/asterisk/configuration:/etc/asterisk" \
  -p "5060:5060/udp" \
  -p "4069:4069/udp" \
  -p "4026:4026/udp" \
  -p "1000-2000:1000-2000/udp" \
  -p "2727:2727/udp" \
  scorpioint/asterisk \
  ```

  * With docker compose

  ```yaml
  version: '3.6'
  services:
    asterisk:
      #image: registry.scpio.net/open-source/asterisk:master
      #or image: scorpioint/asterisk:latest
      #or build: ./asterisk
      container_name: my_asterisk
      volumes:
        - "path/to/asterisk/configuration/:/etc/asterisk"
      ports:
        - "5060:5060/udp"
        - "4069:4069/udp"
        - "4026:4026/udp"
        - "1000-2000:1000-2000/udp"
        - "2727:2727/udp"
  ```
## Deployment
You must have the configuration of your Asterisk server ready before deploying the project. It does not come with any sample configuration file and won't work until you provide them with a volume.

```yaml
version: '3.6'
services:
  asterisk:
    image: registry.scpio.net/open-source/asterisk:master
    #or image: scorpioint/asterisk
    container_name: my_asterisk
    volumes:
      - "path/to/asterisk/configuration/:/etc/asterisk"
    ports:
      - "5060:5060/udp"
      - "4069:4069/udp"
      - "4026:4026/udp"
      - "1000-2000:1000-2000/udp"
      - "2727:2727/udp"
```


## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTION.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Authors

* **Christophe Van Waesberghe** - *Initial work* - [Scorpio Interactive](https://www.chrisv.be)

See also the list of [contributors](https://git.scorpio-interactive.com/open-source/asterisk/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
