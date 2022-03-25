# rocky8-wsl
[![build](https://github.com/kmmiles/rocky8-wsl/actions/workflows/build.yml/badge.svg)](https://github.com/kmmiles/rocky8-wsl/actions/workflows/build.yml)
[![release](https://github.com/kmmiles/rocky8-wsl/actions/workflows/release.yml/badge.svg)](https://github.com/kmmiles/rocky8-wsl/actions/workflows/release.yml)

rocky8 distro for wsl2.

minimal rocky8 + `podman` + `python3` + "wsl" user with `sudo` access.

## Install

- Download and extract the [release](https://github.com/kmmiles/rocky8-wsl/releases) zip.
- Run the `install.bat` script.

NOTE: If `rocky8` distro already exists, it will be **REMOVED**.
The script will warn you before doing so.

## Build it yourself

You'll need `docker` or `podman`.

- Check out the source code and run `./bin/release`
- Copy the zip to windows, extract it, and run `install.bat`

*If you've got Docker, but can't run `bash` scripts, you can still manage.
You just need to copy the process from `./bin/build` and `./bin/export`.*

## Make your own custom distro

You can either:

- Fork this repo and add your own modifications.

- Pull this image into your own `Dockerfile` i.e.

```
FROM ghcr.io/kmmiles/rocky8-wsl:main
```

## How it works

WSL2 distributions are really just containers. We build a container of our liking with `docker`, then export the rootfs as a tarball.
Then this tarball can be imported as a WSL distribution with `wsl.exe --import`.
