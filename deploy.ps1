# DigUp 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/ARahim3/DigUp#install
# 更新日期：2026-10-29
# 类型：binary
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command curl.exe -ErrorAction SilentlyContinue)) { throw '需要先安装 curl（Windows 10+ 自带 curl.exe）' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

curl.exe -fL -o DigUp_0.7.0-beta.3_x64-setup.exe https://github.com/ARahim3/DigUp/releases/download/v0.7.0-beta.3/DigUp_0.7.0-beta.3_x64-setup.exe
$h=(Get-FileHash .\DigUp_0.7.0-beta.3_x64-setup.exe -Algorithm SHA256).Hash.ToLower()
if ($h -ne "013ee9bdc08eb1256cb1b49b0ec11549ae7929f07536e18fbc14fe46d6059fe1") { throw "SHA256 校验失败" }
Write-Host "校验通过：双击安装包完成安装"

Write-Host ''

Write-Host '安装完成：首次打开会下载 865 MB 模型，选好要索引的文件夹，之后按 Ctrl+Shift+Space（Mac 为 ⇧⌘Space）随时搜索'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://github.com/ARahim3/DigUp#install'
