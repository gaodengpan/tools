FROM ubuntu:22.04

RUN apt-get update \
    && apt-get install -y ca-certificates curl \
    && curl https://raw.githubusercontent.com/gaodengpan/tools/master/config/sources.list > /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y man-db wget vim zsh git clang clang-format \
    && apt-get clean

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && /bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/gaodengpan/tools/master/install/go_install.sh)" \
    && go install mvdan.cc/sh/v3/cmd/shfmt@latest \
    && git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime && sh ~/.vim_runtime/install_awesome_vimrc.sh \
    && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
    && curl https://raw.githubusercontent.com/gaodengpan/tools/master/config/.vimrc >> ~/.vim_runtime/my_configs.vim

WORKDIR /root

ENTRYPOINT ["/bin/zsh"]
