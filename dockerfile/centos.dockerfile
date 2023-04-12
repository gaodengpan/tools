FROM dokken/centos-8

RUN rm -f /etc/yum.repos.d/*.repo \
    && curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-8.repo \
    && yum clean all && yum makecache \
    && yum install -y vim  && wget https://github.com/gaodengpan/tools/blob/main/config/.vimrc -O ~/.vimrc \
    && yum install -y git \
    && yum install -y clang \
    && yum install -y clang-tools-extra \
    && wget https://github.com/gaodengpan/tools/blob/main/install/go_install.sh && sh go_install.sh \
    && go install mvdan.cc/sh/v3/cmd/shfmt@latest
