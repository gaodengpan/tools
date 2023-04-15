FROM bitnami/git:2.40.0 AS build

RUN git clone https://github.com/gaodengpan/tools.git

FROM ubuntu:22.04

COPY --from=build tools /tools

WORKDIR /tools

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && cp config/sources.list /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y ca-certificates && apt-get update \
    && apt-get install -y man-db curl wget vim zsh git clang clang-format \
    && apt-get clean

RUN bash -c 'sh install/go_install.sh && source ~/.bashrc \
    && go install mvdan.cc/sh/v3/cmd/shfmt@latest \
    && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim  \
    && cat config/.vimrc >> ~/.vimrc \
    && rm -rf /tools'

WORKDIR ~

ENTRYPOINT ["/bin/zsh"]
