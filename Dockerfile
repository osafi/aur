FROM osafi/arch-pkg-builder

COPY --chown=builder:builder scripts/* /home/builder/
COPY --chown=builder:builder pkglist /home/builder
COPY --chown=builder:builder pkgkeys /home/builder
COPY --chown=builder:builder pkg /home/builder/pkg
