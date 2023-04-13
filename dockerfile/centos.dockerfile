FROM bitnami/git:2.40.0 AS build

RUN git clone https://github.com/gaodengpan/tools.git

FROM dokken/centos-7:latest

COPY --from=build tools /tools

WORKDIR /tools

RUN cat config/.alias >> ~/.bashrc \
    && cat config/.vimrc >> ~/.vimrc \
    && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim  

RUN sh install/go_install.sh && source ~/.bashrc \
    && go install mvdan.cc/sh/v3/cmd/shfmt@latest 

WORKDIR /

RUN  sed -e 's|^mirrorlist=|#mirrorlist=|g' \
         -e 's|^#baseurl=http://mirror.centos.org/centos|baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos|g' \
         -i.bak \
         /etc/yum.repos.d/CentOS-*.repo \
    && yum clean all && yum makecache \
    && yum install -y vim zsh git gcc clang clang-tools-extra \
    && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && rm -rf /tools


ENTRYPOINT ["/bin/zsh"]
