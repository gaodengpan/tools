FROM bitnami/git:2.40.0 AS build

RUN git clone https://github.com/gaodengpan/tools.git

FROM fedora:latest

COPY --from=build tools /tools

WORKDIR /tools

RUN cat config/.alias >> ~/.bashrc \
    && cat config/.vimrc >> ~/.vimrc \
    && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim  

RUN sh install/go_install.sh && source ~/.bashrc \
    && go install mvdan.cc/sh/v3/cmd/shfmt@latest 

WORKDIR /

RUN  sed -e 's|^metalink=|#metalink=|g' \
         -e 's|^#baseurl=http://download.example/pub/fedora/linux|baseurl=https://mirrors.tuna.tsinghua.edu.cn/fedora|g' \
         -i.bak \
         /etc/yum.repos.d/fedora.repo \
         /etc/yum.repos.d/fedora-modular.repo \
         /etc/yum.repos.d/fedora-updates.repo \
         /etc/yum.repos.d/fedora-updates-modular.repo \
    && dnf install -y vim zsh git gcc clang clang-tools-extra \
    && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && rm -rf /tools


ENTRYPOINT ["/bin/zsh"]
