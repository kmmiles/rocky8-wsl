FROM rockylinux/rockylinux:8.5

ENV WSL_DISTRO_NAME rocky8

# install base packages
RUN set -ex; \
  dnf upgrade -y && \
  dnf install -y --nodocs \
    redhat-lsb-core \ 
    cracklib-dicts \
    passwd \
    sudo \
    zsh \
    git \
    python3 \
    podman \
    crun

# set python3 as default python
RUN set -ex; \
  alternatives --set python /usr/bin/python3

# create a user (l/wsl p/wsl)
RUN set -ex; \
  useradd -m -s /bin/bash -G wheel "wsl" && \
  printf "wsl" | passwd --stdin "wsl"

# fix `podman` error: newuidmap: write to uid_map failed: Operation not permitted
RUN set -ex; \
  chmod 4755 /usr/bin/newgidmap && \
  chmod 4755 /usr/bin/newuidmap

# create dumb `docker` wrapper for `podman`
RUN set -ex; \
  printf "#!/bin/sh\n" > /usr/bin/docker && \
  printf "exec /usr/bin/podman \"\$@\"\n" >> /usr/bin/docker && \
  chmod +x /usr/bin/docker

# copy configs
COPY ./etc/passwordless /etc/sudoers.d/passwordless
COPY ./etc/fstab /etc/fstab
COPY ./etc/wsl.conf /etc/wsl.conf

# cleanup
RUN set -ex; \
  dnf autoremove -y && \
  dnf clean all -y && \
  find /root -mindepth 1 -exec rm -rf {} \; && \
  find /tmp -mindepth 1 -exec rm -rf {} \; && \
  find /var/tmp -mindepth 1 -exec rm -rf {} \; && \
  find /var/cache -type f -exec rm -rf {} \; && \
  find /var/log -type f | while read f; do /bin/echo -ne "" > $f; done


# create dumb file to signify box is provisioned
RUN set -ex; \
  date > /etc/is_provisioned
