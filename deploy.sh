#!/usr/bin/env bash
set -euo pipefail
# DigUp 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/ARahim3/DigUp#install
# 更新日期：2026-10-29
# 类型：binary
cd "$(dirname "${BASH_SOURCE[0]}")"

command -v curl >/dev/null 2>&1 || { echo "需要先安装 curl"; exit 1; }

mkdir -p .download
cd .download

curl -fL -o DigUp_0.7.0-beta.3_amd64.AppImage https://github.com/ARahim3/DigUp/releases/download/v0.7.0-beta.3/DigUp_0.7.0-beta.3_amd64.AppImage
echo "f41d4a54b987371b22e5a26ae6fe4968d0e3c4fd7f63c6580441f257278cdb6f  DigUp_0.7.0-beta.3_amd64.AppImage" | sha256sum -c -
chmod +x DigUp_0.7.0-beta.3_amd64.AppImage
echo "校验通过：运行 ./DigUp_0.7.0-beta.3_amd64.AppImage"

echo ""

echo "安装完成：首次打开会下载 865 MB 模型，选好要索引的文件夹，之后按 Ctrl+Shift+Space（Mac 为 ⇧⌘Space）随时搜索"
echo "若结果异常或需要改配置，请参考官方文档：https://github.com/ARahim3/DigUp#install"
