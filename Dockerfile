FROM rockylinux/rockylinux:8.5

ENV WSL_DISTRO_NAME rocky8

# install base packages
RUN set -ex; \
  dnf install -y \
    cracklib-dicts \
    passwd \
    sudo \
    zsh \
    git \
    python39

# set python3 as default python
RUN set -ex; \
  alternatives --set python /usr/bin/python3

# create a user (l/wsl p/wsl)
RUN set -ex; \
  useradd -m -s /bin/bash -G wheel "wsl" && \
  printf "wsl" | passwd --stdin "wsl"

# copy configs
COPY ./etc/passwordless /etc/sudoers.d/passwordless
COPY ./etc/fstab /etc/fstab
COPY ./etc/wsl.conf /etc/wsl.conf

# create dumb file to signify box is provisioned
RUN set -ex; \
  date > /etc/is_provisioned
