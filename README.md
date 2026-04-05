# DOTagHelper 🏷️

[English](README_en.md) | 简体中文 | [使用指南](manual_zh-CN.md)

一个专为强大文件管理器 **Directory Opus** 量身定制的高级标签辅助与过滤工具。
通过现代化的可视化界面，帮助你更高效地管理文件标签、生成复杂的搜索语法、并实现工作区的自由定制。

> 本项目基于 [XYplorerTagHelper](https://github.com/C21H21NO2S/XYplorerTagHelper) 改编适配。

## ✨ 核心特性

* **🚀 可视化标签树**：告别繁琐的纯文本输入，支持无限层级的标签分组、自由拖拽排序。
* **🔍 智能过滤构建**：支持通过点击组合条件（路径、文件名、备注、标注、评分、大小、日期），自动生成并发送 Directory Opus 的高级过滤语法 (FILTERDEF)。
* **🎨 现代原生 UI**：内置暗黑 (Dark) 与浅色 (Light) 双主题，支持自定义组件颜色、原生 Windows 11 标题栏沉浸式体验。
* **💼 多工作区管理**：根据不同的工作流（如"默认工作区"、"项目状态"等）隔离标签数据，支持快速切换。
* **⚡ 极速交互**：支持从剪贴板智能读取并激活标签、支持一键同步 Directory Opus 标注 (Labels)。
* **🤖 AI 自动打标**：集成 Ollama 本地 AI，支持按文件名或文件内容自动生成标签。
* **🏷️ UCS 标签系统**：内置 UCS 音效分类词典，可批量为音效文件打标签。

## 📥 下载与安装 (非程序员推荐)

如果你只想直接使用该软件，无需配置任何代码环境：
1. 前往本项目的 [Releases 页面](https://github.com/C21H21NO2S/DOTagHelper/releases)
2. 下载最新版本的 `DOTagHelper_ver.7z`
3. 解压后，双击运行 `DOTagHelper.exe` 即可使用。

## 💻 从源码运行 (开发者)

如果你安装了 Python 环境，可以按以下步骤运行或二次开发（requirements：pywebview≥4.0）：

```bash
# 克隆仓库
git clone https://github.com/C21H21NO2S/DOTagHelper.git
cd DOTagHelper

# 安装依赖项 (核心依赖为 pywebview)
pip install -r requirements.txt

# 运行程序
python DOTagHelper.py
```

## 🛠️ 配合 Directory Opus 的使用准备

为了让 Helper 顺利控制 Directory Opus，请确保：

1. **Directory Opus 已安装并正在运行**。
2. 在软件设置（点击右上角齿轮图标 ⚙️）中，正确配置了 **dopusrt.exe 路径**（例如：`C:\Program Files\GPSoftware\Directory Opus\dopusrt.exe` 或安装文件夹路径）。
3. 点击"测试路径"按钮确认连接成功。

### 核心命令对应关系

| 功能 | Directory Opus 命令 |
|------|---------------------|
| 打标签 | `SetAttr META "tags:+tag1;+tag2;-tag3"` |
| 搜索/过滤 | `Select FILTERDEF ... FILTERDEF` |
| 导航 | `Go "path"` |
| 读标签 | `Clipboard SET {file|tags}` |
| 设置标注 | `Properties SETLABEL` |

## 🙋‍♂️ 关于与反馈

本工具基于 XYplorerTagHelper 改编，适配 Directory Opus 文件管理器。

如果你在使用过程中遇到任何 Bug 或有好的功能建议，欢迎在 GitHub Issues 中提交！
