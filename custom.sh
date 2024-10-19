#!/bin/bash

checkOS() {
	os_str=$1
	os_id=""
	for id in debian ubuntu alpine; do
		echo "$os_str" | grep -iq $id
		if [[ $? -eq 0 ]]; then
			os_id=$id
			break
		fi
	done

	echo -n $os_id
}

NAME="imunes/template"
# set ulimits because if they are unlimited apparently the Linux kernel slows
# things down:
# - https://github.com/docker/for-linux/issues/73
# - https://github.com/docker/for-linux/issues/502
ULIMITS="--ulimit nofile=10240:10240 --ulimit nproc=65356:65536"
CUSTOM_FOLDER="custom"

image="$1"
if [[ -z "$image" ]]; then
	echo "Usage: $0 image [newtag]"
	exit 1
fi

tag="custom"
if [[ -n "$2" ]]; then
    tag="$2"
fi

base=""
if [[ -n "$3" ]]; then
    base="$3"
fi

docker pull $image
if [[ $? -ne 0 ]]; then
	echo "Error pulling image '$image'"
	exit 1
fi

if [[ -n "$base" ]]; then
	folder=$CUSTOM_FOLDER/$base
	echo "Checking folder '$folder'"
else
	info=$(docker run --rm --entrypoint /bin/sh $image -c 'cat /etc/*-release')
	if [[ $? -ne 0 ]]; then
		echo "Error fetching OS version from container ($image)"
		exit 1
	fi
	echo "$info"

	base=$(echo "$info" | grep -E '^ID=' | sed 's/ID=\(.*\)/\1/' | tr -d '"')
	folder=$CUSTOM_FOLDER/$base
	echo "Checking folder '$folder'"
	if [[ -z "$base" || ! -d $folder ]]; then
		base=$(echo "$info" | grep -E '^ID_LIKE=' | sed 's/ID_LIKE=\(.*\)/\1/' | tr -d '"')
		folder=$CUSTOM_FOLDER/$base
		echo "Checking folder '$folder'"
	fi

	if [[ -z "$base" || ! -d $folder ]]; then
		base=$(checkOS $(echo "$info" | grep -E '^NAME='))
		folder=$CUSTOM_FOLDER/$base
		echo "Checking folder '$folder'"
	fi
fi

if [[ -z "$base" || ! -d "$folder" ]]; then
	echo ""
	echo "Couldn't find base OS folder, quitting"
	exit 1
fi

rm -f /tmp/imunes_template_build_${tag}.log
image_name="$NAME:$tag"
start=$(date +%s.%N)
echo "[+] Building '$image_name' from '$folder'."
cat $folder/Dockerfile | sed "s+^FROM replace:me\$+FROM $image+" | docker build $ULIMITS --tag=$image_name --file - . > /tmp/imunes_template_build_${tag}.log || exit 1
end=$(date +%s.%N)
runtime=$(echo "scale=5; (${end} - ${start})/1" | bc)
echo "[+] Built image '$image_name' in $runtime s."
echo "Entrypoint/cmd for the original image $image:"
docker inspect -f '{{join .Config.Entrypoint "\" \""}} "{{join .Config.Cmd "\" \""}}"' $image
