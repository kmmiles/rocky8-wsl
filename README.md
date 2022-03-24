# docker-rocky8-wsl

minimal rocky8 distro for wsl2.

 - boots as user `wsl` with `sudo` access
 - includes bind mount, allowing fs access from other distros (`/mnt/wsl/instances/rocky8`)
 - includes `git` and `python3`

# instructions

```bash
./bin/build && ./bin/export
```

will write `rocky8-wsl-container.tar`.

this can now be imported into wsl.

```powershell
wsl --import rocky8 c:\Users\kenne\WSL2\systems\rocky8 c:\Users\kenne\WSL2\sources\rocky8-wsl-container.tar
wsl -d rocky8
```
