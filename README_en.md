# DOTagHelper 🏷️

English | [简体中文](README.md) | [Manual](manual_en.md)

An advanced tag helper and filtering tool tailored specifically for the powerful file manager **Directory Opus**. 
Through a modern visual interface, it helps you manage file tags more efficiently, generate complex search syntaxes, and fully customize your workspaces.

> This project is adapted from [XYplorerTagHelper](https://github.com/C21H21NO2S/XYplorerTagHelper).

## ✨ Core Features

* **🚀 Visual Tag Tree**: Say goodbye to tedious plain text input. Supports infinite levels of tag grouping and free drag-and-drop sorting.
* **🔍 Smart Filter Builder**: Generate and send advanced Directory Opus filter syntaxes (FILTERDEF) automatically by clicking and combining conditions (Path, File Name, Remarks, Labels, Ratings, Size, Date).
* **🎨 Modern Native UI**: Built-in Dark and Light dual themes. Supports custom component colors and provides an immersive native Windows 11 title bar experience.
* **💼 Multi-Workspace Management**: Isolates tag data based on different workflows (e.g., "Default Workspace", "Project Status") and supports fast switching.
* **⚡ Lightning-Fast Interaction**: Intelligently reads and activates tags from the clipboard, and supports one-click synchronization with Directory Opus Labels.
* **🤖 AI Auto-Tagging**: Integrated with local Ollama AI, supports automatic tag generation based on file names or file content.
* **🏷️ UCS Tag System**: Built-in UCS sound effects classification dictionary for batch tagging audio files.

## 📥 Download and Installation (Recommended for Non-Programmers)

If you just want to use the software directly without configuring any coding environment:
1. Go to the [Releases page](https://github.com/C21H21NO2S/DOTagHelper/releases) of this project.
2. Download the latest version of `DOTagHelper_ver.7z`.
3. After extracting, double-click `DOTagHelper.exe` to start using it.

## 💻 Running from Source Code (For Developers)

If you have a Python environment installed, you can run or further develop it by following these steps (requirements: pywebview≥4.0):

```bash
# Clone the repository
git clone https://github.com/C21H21NO2S/DOTagHelper.git
cd DOTagHelper

# Install dependencies (The core dependency is pywebview)
pip install -r requirements.txt

# Run the program
python DOTagHelper.py
```

## 🛠️ Preparation for Use with Directory Opus

To allow the Helper to smoothly control Directory Opus, please ensure:

1. **Directory Opus is installed and running**.
2. In the software settings (click the gear icon ⚙️ in the top right corner), the **dopusrt.exe path** is configured correctly (e.g., `C:\Program Files\GPSoftware\Directory Opus\dopusrt.exe` or the installation folder path).
3. Click the "Test Path" button to confirm a successful connection.

### Core Command Mappings

| Function | Directory Opus Command |
|----------|----------------------|
| Add Tags | `SetAttr META "tags:+tag1;+tag2;-tag3"` |
| Search/Filter | `Select FILTERDEF ... FILTERDEF` |
| Navigate | `Go "path"` |
| Read Tags | `Clipboard SET {file|tags}` |
| Set Label | `Properties SETLABEL` |

## 🙋‍♂️ About & Feedback

This tool is adapted from XYplorerTagHelper for the Directory Opus file manager.

If you encounter any bugs or have great feature suggestions during use, you are welcome to submit them in the GitHub Issues!
