FROM bitnami/git:latest AS build

RUN git clone https://github.com/gaodengpan/tools.git

FROM dokken/centos-8

COPY --from=build tools .

RUN rm -f /etc/yum.repos.d/*.repo \
    && curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-8.repo \
    && cat tools/config/.alias >> ~/.bashrc \
    && sh tools/install/go_install.sh && source ~/.bashrc \
    && go install mvdan.cc/sh/v3/cmd/shfmt@latest \
    && yum install -y vim \
    && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim  \
    && cat tools/config/.vimrc -O ~/.vimrc \
    && yum install -y git \
    && yum install -y clang \
    && yum install -y clang-tools-extra \
    && yum clean all \
    && rm -rf tools
