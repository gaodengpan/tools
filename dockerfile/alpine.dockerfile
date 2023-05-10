FROM alpine:latest

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update && apk upgrade \
    && apk add man-db wget curl vim zsh git go clang \
    && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && zsh -c "$(curl -fsSL https://raw.githubusercontent.com/gaodengpan/tools/master/install/go_install.sh)"  \
    && zsh -c "$(curl -fsSL https://raw.githubusercontent.com/gaodengpan/tools/master/install/vim_install.sh)"

WORKDIR /root

ENTRYPOINT ["/bin/zsh"]
