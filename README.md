# rocky8-wsl

Minimal rocky8 distro for wsl2.

 - boots as user `wsl` with `sudo` access
 - includes bind mount, allowing fs access from other distros (`/mnt/wsl/instances/rocky8`)
 - includes `git` and `python3`

# instructions

Builds `dist/rocky8-wsl-container.tar`:

```bash
./bin/build && ./bin/export
```

Import as WSL distro (adjust paths as necessary):

```powershell
wsl --import rocky8 "$env:USERPROFILE\WSL2\systems\rocky8" "$env:USERPROFILE\WSL2\sources\rocky8-wsl-container.tar"
wsl -d rocky8
```
