# rocky8-wsl

[![build](https://github.com/kmmiles/rocky8-wsl/actions/workflows/build.yml/badge.svg)](https://github.com/kmmiles/rocky8-wsl/actions/workflows/build.yml)
[![release](https://github.com/kmmiles/rocky8-wsl/actions/workflows/release.yml/badge.svg)](https://github.com/kmmiles/rocky8-wsl/actions/workflows/release.yml)


rocky8 distro for wsl2.

minimal base + `podman` + `python3` + "wsl" user with `sudo` access.

# instructions

build and export: `./bin/build && ./bin/export`

import as wsl distro (adjust paths as necessary):

```powershell
wsl --unregister rocky8
wsl --import rocky8 "$env:USERPROFILE\WSL2\systems\rocky8" "$env:USERPROFILE\WSL2\sources\rocky8-wsl-container.tar"
wsl -d rocky8
```

```cmd
powershell.exe -noprofile -executionpolicy bypass -file .\install.ps1
```
