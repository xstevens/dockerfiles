FROM node:lts-slim
LABEL maintainer="Xavier Stevens"

# set DEBIAN_FRONTEND to convey no-TTY during build
ARG DEBIAN_FRONTEND=noninteractive

# add user
RUN useradd -s /sbin/nologin -m -u 10000 -U user

USER user

CMD ["/bin/bash"]
