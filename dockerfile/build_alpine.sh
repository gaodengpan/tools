#! /bin/sh

if [ $# -eq 0 ]; then
	printf "usage: %s version [build options]\n" $0
	exit 0
fi

version=$1
shift
options="$*"
IMAGE=gaodp/alpine

# build
docker build $options --add-host raw.githubusercontent.com:185.199.108.133 -t $IMAGE:$version -f alpine.dockerfile .

if [ $? -ne 0 ]; then
	exit 1
fi

# tag
docker tag $IMAGE:$version $IMAGE:latest
# push
{
    docker push $IMAGE:$version > /dev/null
    docker push $IMAGE:latest > /dev/null
} &
