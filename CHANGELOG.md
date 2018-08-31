# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.0.2] - 2018-08-31
### Misc
- Tag semantic fix

## [0.0.1] - 2018-08-31
### Asterisk
- Available version(s) and module(s) in this release:
  - `v13.0.22`
    - Enabled:
      - `MOH-OPSOUND-ULAW`
      - `CORE-SOUNDS-FR-ULAW`
      - `EXTRA-SOUNDS-FR-ULAW`
    - Disabled:
      - `MOH-OPSOUND-WAV`

### Added
- Initializing the repository
- Creation of the Dockerfile for Asterisk 13.0.22 with french voice and codecs
- Initializing the CI for building and pushing the image to our registry and docker hub
