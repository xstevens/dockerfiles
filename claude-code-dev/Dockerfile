FROM ubuntu:26.04
LABEL maintainer="Xavier Stevens"

ARG LLVM_VERSION=21
ARG SYSTEM_ARCH=aarch64
ARG UV_VERSION=0.11.13

# base packages
RUN apt update && \
    apt install -y --no-install-recommends \
        bubblewrap \
        build-essential \
        ca-certificates \
        cargo \
        cmake \
        curl \
        dnsutils \
        fd-find \
        git \
        ipset \
        iptables \
        iproute2 \
        jq \
        libssl-dev \
        libuv1-dev \
        libwslay-dev \
        libwslay1 \
        make \
        ripgrep \
        rustc \
        shellcheck \
        shfmt \
        unzip \
        vim \
        zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV EDITOR=vim

# add llvm
RUN curl -s -o /etc/apt/trusted.gpg.d/apt.llvm.org.asc https://apt.llvm.org/llvm-snapshot.gpg.key && \
    echo 'deb http://apt.llvm.org/noble/ llvm-toolchain-noble main' > /etc/apt/sources.list.d/llvm.list && \
    echo 'deb-src http://apt.llvm.org/noble/ llvm-toolchain-noble main' >> /etc/apt/sources.list.d/llvm.list
RUN apt update && apt install -y --no-install-recommends \
        clang \
        lld \
        lldb \
        llvm \
        llvm-dev \
        libc++-dev \
        libc++abi-dev \
        libclang-rt-${LLVM_VERSION}-dev \
        libpolly-${LLVM_VERSION}-dev \
        libfuzzer-${LLVM_VERSION}-dev

# Ubuntu and LLVM packages don't setup lld as ld by default using alternatives so do that here
# because some makefiles are bad at allowing overrides to the linker
RUN update-alternatives --install /usr/bin/ld ld /usr/bin/ld.lld 100

# Checkout and build AFL++
RUN cd /tmp && \
    git clone https://github.com/AFLplusplus/AFLplusplus.git && \
    cd AFLplusplus && \
    make STATIC=1 LLVM_CONFIG=llvm-config-${LLVM_VERSION} && make install

# add uv
RUN cd /tmp && \
    ARCH=$(uname -m) \
    curl -Lf -O https://github.com/astral-sh/uv/releases/download/${UV_VERSION}/uv-${SYSTEM_ARCH}-unknown-linux-gnu.tar.gz && \
    tar xvzf uv-${SYSTEM_ARCH}-unknown-linux-gnu.tar.gz && \
    cp /tmp/uv-${SYSTEM_ARCH}-unknown-linux-gnu/uv /usr/local/bin/ && \
    cp /tmp/uv-${SYSTEM_ARCH}-unknown-linux-gnu/uvx /usr/local/bin/

# add awscli
RUN cd /tmp && \
    curl -s -o awscliv2.zip https://awscli.amazonaws.com/awscli-exe-linux-${SYSTEM_ARCH}.zip && \
    unzip awscliv2.zip && \
    ./aws/install

# add claude
RUN curl -s -o /etc/apt/trusted.gpg.d/claude-code.asc https://downloads.claude.ai/keys/claude-code.asc && \
    echo 'deb https://downloads.claude.ai/claude-code/apt/stable stable main' > /etc/apt/sources.list.d/claude-code.list
RUN apt update && \
    apt install -y claude-code

# add user
RUN useradd -s /sbin/nologin -m -u 10000 -U user -d /home/user

USER user
WORKDIR /home/user
VOLUME /src
VOLUME /home/user/.aws

# add claude skills
RUN claude plugin marketplace add anthropics/skills && \
    claude plugin marketplace add trailofbits/skills
ADD claude/settings.json /home/user/.claude/
ADD claude/statusline.sh /home/user/.claude/
ADD claude/CLAUDE.md /home/user/.claude/

# install python and tools
RUN uv python install 3.12 --default && \
    uv tool install ruff && \
    uv tool install ty && \
    uv tool install pip-audit

ENV UV_LINK_MODE=copy

# install zizmor
RUN cargo install --locked zizmor

ENV PATH="$PATH:/usr/local/bin:/home/user/.local/bin:/home/user/.cargo/bin"
WORKDIR /src

CMD ["/bin/bash"]

# TODO: eventually automate this in an entrypoint script perhaps but post boot currently if you want to use trailmark
# uv venv
# necessary override because trailmark max version specified in its pyproject
# uv pip install trailmark tree-sitter-language-pack==1.6.2
