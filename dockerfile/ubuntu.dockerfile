FROM ubuntu:22.04

RUN apt-get update \
    && apt-get install -y ca-certificates curl \
    && curl https://raw.githubusercontent.com/gaodengpan/tools/master/config/sources.list > /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y man-db wget zsh git clang clang-format \
    && apt-get clean

RUN  /bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/gaodengpan/tools/master/install/go_install.sh)" 

WORKDIR /root

ENTRYPOINT ["/bin/zsh"]
