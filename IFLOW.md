# iFlow 上下文信息

## 项目概述

这是一个 NixOS 配置项目，用于管理和配置基于 NixOS 的系统环境，特别是针对 WSL (Windows Subsystem for Linux) 环境。它使用 Nix Flakes 和 Home Manager 来声明式地管理系统的全局包、服务以及用户的个人配置（如 Neovim, Tmux, Git 等）。

主要技术栈：
- **NixOS**: 一个基于 Nix 包管理器的 Linux 发行版，强调可重现性和声明式配置。
- **Nix Flakes**: 用于管理 Nix 项目的依赖和构建。
- **Home Manager**: 一个 NixOS 模块，用于管理用户的家目录配置。
- **Neovim**: 高度可配置的文本编辑器。
- **Tmux**: 终端复用器。

## 目录结构

```
.
├── configuration.nix      # 系统级别的 NixOS 配置
├── flake.nix              # Nix Flakes 入口文件，定义了输入（inputs）和输出（outputs）
├── home.nix               # 用户级别的 Home Manager 配置
├── configs/               # 各种应用程序的配置文件
│   ├── nvim/              # Neovim 配置
│   ├── tmux.conf          # Tmux 配置文件
│   └── proxychains.conf   # Proxychains 配置文件
├── secrets/               # 存放敏感信息（如 SSH 密钥），未被版本控制（通过 .gitignore）
└── IFLOW.md               # 此文件
```

## 核心配置文件说明

1.  **`flake.nix`**:
    - 定义了项目依赖：`nixpkgs` (Nix Packages collection), `nixos-wsl` (WSL 支持), `home-manager`。
    - 定义了输出：一个名为 `nixos` 的 NixOS 系统配置。
    - 启用了 Nix garbage collection。
    - 集成了 `nixos-wsl` 和 `home-manager` 模块。

2.  **`configuration.nix`**:
    - 系统级别的配置。
    - 启用了 Nix experimental features (`nix-command`, `flakes`)。
    - 安装了系统级的包：`git`, `vim`, `wget`, `tmux`, `neovim`, `lua`, `luarocks`, `proxychains`, `inetutils`。

3.  **`home.nix`**:
    - 用户级别的配置，由 Home Manager 管理。
    - 配置了用户名和家目录路径。
    - 通过 `home.file` 将 `configs/` 目录下的配置文件（如 `.tmux.conf`, `.config/nvim`）软链接到用户家目录的相应位置。
    - 通过 `home.packages` 安装了大量用户级的命令行工具（如 `ripgrep`, `jq`, `eza`, `fzf`, `nodejs_24` 等）。
    - 配置了 `git` 用户名和邮箱。
    - 启用了 `starship` shell 提示符。
    - 配置了 `bash`，包括 `PATH` 和一些别名（当前为空）。

4.  **`configs/nvim/`**:
    - Neovim 的配置目录。
    - `init.lua`: 入口文件，加载核心配置和插件管理器。
    - `lua/core/options.lua`: 设置基本的编辑器选项（如行号、缩进、搜索等）。
    - `lua/core/keymaps.lua`: 定义核心快捷键（如窗口移动、重新加载配置等）。
    - `lua/config/lazy.lua`: 配置 `lazy.nvim` 插件管理器。
    - `lua/plugins/`: 存放各个 Neovim 插件的配置。

## 使用方法

1.  **应用配置**:
    要应用这些配置，通常需要在 NixOS 系统中运行以下命令来重建系统：
    ```bash
    sudo nixos-rebuild switch --flake .#nixos
    ```
    这条命令会根据 `flake.nix` 和相关配置文件（`configuration.nix`, `home.nix`）来构建并切换到新的系统环境。

2.  **更新配置**:
    修改任何 `.nix` 或 `configs/` 下的配置文件后，都需要重新运行上述 `nixos-rebuild switch` 命令来使更改生效。

3.  **更新 Flakes 输入**:
    如果需要更新 `nixpkgs` 或其他 Flakes 输入，可以运行：
    ```bash
    nix flake update
    ```

## 开发约定

- 所有 Nix 配置文件使用 `.nix` 扩展名。
- Home Manager 配置集中在 `home.nix` 文件中。
- 应用程序特定的配置文件存放在 `configs/` 目录下，并通过 `home.nix` 中的 `home.file` 软链接到用户家目录。
- 敏感信息（如 SSH 密钥）应存放在 `secrets/` 目录下，并确保它们没有被 Git 跟踪（已通过 `.gitignore` 实现）。