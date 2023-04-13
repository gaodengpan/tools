FROM dokken/centos-8

RUN rm -f /etc/yum.repos.d/*.repo \
    && curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-8.repo \
    && cat config/.alias >> ~/.bashrc \
    && sh install/go_install.sh && source ~/.bashrc \
    && go install mvdan.cc/sh/v3/cmd/shfmt@latest \
    && yum install -y vim \
    && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim  \
    && cat config/.vimrc -O ~/.vimrc \
    && yum install -y git \
    && yum install -y clang \
    && yum install -y clang-tools-extra \
    && yum clean all 
