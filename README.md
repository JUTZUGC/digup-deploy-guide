# DigUp 一键安装指南

> 第三方部署指南 · 非 DigUp 官方仓库。官方项目：[ARahim3/DigUp](https://github.com/ARahim3/DigUp)
> 内容来自官方文档（2026-10-29）。项目迭代快，请以[官方文档](https://github.com/ARahim3/DigUp#install)为准。

[![⚡ 一键安装](https://img.shields.io/badge/%E2%9A%A1_%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#一键安装推荐用百度搭子)

## 一键安装（推荐：用百度搭子）

> [!TIP]
> 不用记文件名，直接描述「海边那只狗」或「租约里关于宠物的条款」，它能在本机把文件翻出来。

⚠️ macOS 需要 Apple Silicon 与 macOS 14+；Windows 为 10/11 64 位；Linux 为 amd64 的 deb / AppImage。首次使用要下载 865 MB 模型，索引全在本机，不上传文件。Windows 安装包未签名，系统可能提示未知发布者。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/digup-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子会按系统选安装包，下载后比对 SHA256，再引导你完成安装，按它的提示确认即可，结束时它会告诉你结果。
   （下载地址与校验方式以官方文档为准。）



## DigUp 是什么？

DigUp 是开源的按内容搜索本机文件的多模态桌面应用，基于 Google DeepMind 的 EmbeddingGemma 2（协议：MIT，<img src="https://img.shields.io/github/stars/ARahim3/DigUp?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

把 EmbeddingGemma 2 的多模态嵌入用到本机文件：图片、PDF、文档、录音、视频、代码放进同一个语义空间，用自然语言跨类型搜索，并跳到 PDF 页码或视频时间点。

- 跨类型搜索：图片、PDF、文档、录音、视频、代码
- 多语言：100+ 语言互相检索
- 本机索引：文件不上传，无账号、无遥测
- 精确匹配：发票号、错误码、人名按原样命中
- 跳到位置：PDF 页码、视频时间点、代码行
- 三平台：macOS、Windows、Linux 都有安装包

（来源：[官方仓库](https://github.com/ARahim3/DigUp)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 6 | k |
| 搜 | 索 |
| 跨 | 类 |
| 隐 | 私 |
| 三 | 平 |
| M | I |

| 需要注意 | 说明 |
|---|---|
| 首 | 次 |
| W | i |
| m | a |
| 索 | 引 |
| 不 | 是 |

> 以上基于官方文档与社区反馈整理（2026-10-29），以官方最新文档为准。

## 官方安装方式（可手动执行）

```bash
curl -fL -o DigUp_0.7.0-beta.3_amd64.AppImage https://github.com/ARahim3/DigUp/releases/download/v0.7.0-beta.3/DigUp_0.7.0-beta.3_amd64.AppImage
echo "f41d4a54b987371b22e5a26ae6fe4968d0e3c4fd7f63c6580441f257278cdb6f  DigUp_0.7.0-beta.3_amd64.AppImage" | sha256sum -c -
chmod +x DigUp_0.7.0-beta.3_amd64.AppImage
echo "校验通过：运行 ./DigUp_0.7.0-beta.3_amd64.AppImage"
```

安装包来源：[https://github.com/ARahim3/DigUp#install](https://github.com/ARahim3/DigUp#install)

## 验证状态

| 场景 | 状态 |
|---|---|
| README 确认三平台要求、865 MB 模型与本地索引 | 已核对 2026-10-29 |
| Release v0.7.0-beta.3 资产名、大小与 SHA256 已核对 | 已核对 2026-10-29 |
| 未实测安装（会下载 38–140 MB 安装包并安装） | 说明 2026-10-29 |
| MCP 冒烟：initialize / tools/list 返回 get_guide、search_guide、get_project_info | 已验证 2026-10-29 |
| 非目标宿主调用 get_guide 被拦截（HOST_NOT_ALLOWED） | 已验证 2026-10-29 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

项目本身不含 MCP；本仓库的 MCP 只提供安装包选择、SHA256 校验与常见问题。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-10-29）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\digup-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 安装包对照

| 平台 | 文件 | 大小 | 说明 |
|---|---|---|---|
| macOS | DigUp-0.6.2.dmg | 8.5 MB | Apple Silicon，macOS 14+，也可 brew install --cask arahim3/tap/digup |
| Windows | DigUp_0.7.0-beta.3_x64-setup.exe | 38.7 MB | Win10/11 64 位，免管理员，未签名 |
| Linux | DigUp_0.7.0-beta.3_amd64.deb | 39.6 MB | Ubuntu 22.04 / Debian 12 / Mint 21+ |
| Linux | DigUp_0.7.0-beta.3_amd64.AppImage | 139.7 MB | 其它发行版，chmod +x 后直接运行 |

Windows 与 Linux 目前是 beta 包，正式版 Release 只有 macOS DMG。

## 第一次使用

1. 打开 DigUp，等模型下载完（865 MB，只下一次）
2. 选择要索引的文件夹，可以只选子目录
3. 在任意应用里按快捷键：Mac 是 ⇧⌘Space，Windows / Linux 是 Ctrl+Shift+Space
4. 用一句话描述要找的东西，回车打开，PDF 会跳到页码，视频跳到时间点

## 注意

- 只索引你选择的目录，文件不离开本机
- 首次索引耗时取决于文件数量，界面会给出预估
- Windows 安装包未签名，出现未知发布者提示时选择「更多信息 → 仍要运行」
- 卸载后模型缓存可能仍在，需要手动清理

## 常见坑

- Mac 打不开：确认是 Apple Silicon 且系统 14+
- Windows 提示未知发布者：安装包未签名，核对 SHA256 后再运行
- Linux 装不上：deb 用 sudo apt install ./文件名.deb，别用 dpkg -i 跳过依赖
- 搜不到文件：确认目标文件夹已加入索引，且首轮索引完成
- 快捷键没反应：到设置里改快捷键，Wayland 桌面需在系统里手动绑定
- 磁盘占用变大：模型与索引缓存会占空间，卸载后手动清理

## 免责声明

本仓库为第三方指南，与 DigUp 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-10-29），项目迭代快，请以[官方文档](https://github.com/ARahim3/DigUp#install)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
