FROM archlinux:base-devel

RUN pacman-key --init && pacman -Sy archlinux-keyring --noconfirm && pacman -Syu --noconfirm
RUN pacman -S --noconfirm clang ccache base-devel distcc bash git
RUN pacman -Scc --noconfirm

# SetUp cross compile
# create the user
RUN useradd aur --system --create-home --home-dir /var/aur
RUN echo "aur ALL=(ALL) NOPASSWD: /usr/bin/pacman" > "/etc/sudoers.d/allow_aur_to_pacman"
RUN su - aur -c "cd ~ && git clone https://aur.archlinux.org/distccd-alarm.git && cd distccd-alarm && makepkg -si --noconfirm"


COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT [ "/usr/bin/bash","-c","/docker-entrypoint.sh"]

#distccd --daemon --no-detach --user distcc --port 3632 --stats --stats-port 3633 --log-level info --log-stderr --listen 0.0.0.0 --jobs 10

#docker run -d -p 3632-3633:3632-3633 --name gentoo-distcc-ccache --rm -v /var/Shares/PoolData/ccache/:/var/cache/ccache:Z ksmanis/gentoo-distcc:tcp-ccache --stats
CMD [\
  "--allow", "0.0.0.0/0", \
  "--nice", "10", \
  "-p","3632-3638:3632:3638", \
]

EXPOSE 3632-3638

HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://0.0.0.0:3633/ || exit 1
