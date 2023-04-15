FROM bitnami/git:2.40.0 AS build

RUN git clone https://github.com/gaodengpan/tools.git

FROM ubuntu:latest

COPY --from=build tools /tools

WORKDIR /tools

RUN apt-get update \
    && apt install -y man-db curl wget vim zsh git gcc clang clang-format 

RUN sh install/go_install.sh \
    && go install mvdan.cc/sh/v3/cmd/shfmt@latest \
    && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim  \
    && cat config/.vimrc >> ~/.vimrc 

WORKDIR ~

ENTRYPOINT ["/bin/zsh"]
