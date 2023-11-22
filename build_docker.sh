#!/bin/bash
RED='\033[0;31m'
RED='\033[0;32m'
NC='\033[0m' # No Color

APP_NAME=$1
APP_VERSION=$2

set -e

export BUILD_ID=dontKillMe

BASEDIR=$(cd `dirname "$0"`; pwd)
cd "$BASEDIR"

echo "脚本执行目录$BASEDIR"

TARGET_DIR="$BASEDIR/$APP_NAME"
echo "构建应用目录$TARGET_DIR"

# abc="$TARGET_DIR/target/*.jar"
# echo $abc
# files=$(ls "$abc" 2> /dev/null | wc -l)
# echo $files
# if [[ "$files" == "0" ]];then
#     echo "${RED}target文件夹不存在，请先构建${NC}"
#     exit
# fi
if [[ ! -d "$TARGET_DIR/target" ]];then
    echo "${RED}target文件夹不存在，请先构建${NC}"
    exit
fi

if [[ ! -d "$TARGET_DIR/target/dependency" ]];then
    echo "解压jar包"
    mkdir -p ${TARGET_DIR}/target/dependency && (cd ${TARGET_DIR}/target/dependency; jar -xf ${TARGET_DIR}/target/*.jar)
fi

# 构建镜像
docker build -f ${TARGET_DIR}/Dockerfile -t dubbo/com.sinsmiya.${APP_NAME}:${APP_VERSION} -t dubbo/com.sinsmiya.${APP_NAME}:latest .