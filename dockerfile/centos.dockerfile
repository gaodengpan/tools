FROM dokken/centos-8

RUN rm -f /etc/yum.repos.d/*.repo \
    && curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-8.repo \
    && curl https://gitee.com/gaodp486/tools/raw/main/config/.alias >> ~/.bashrc \
    && bash -c "$(curl -fSsL https://gitee.com/gaodp486/tools/raw/main/install/go_install.sh)" && source ~/.bashrc \
    && go install mvdan.cc/sh/v3/cmd/shfmt@latest \
    && yum install -y vim  && wget https://gitee.com/gaodp486/tools/raw/main/config/.vimrc -O ~/.vimrc \
    && yum install -y git \
    && yum install -y clang \
    && yum install -y clang-tools-extra \
    && yum clean all
