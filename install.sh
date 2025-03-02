#!/bin/bash

CONFIG_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)" # 自动获取脚本所在路径
backup_dir="$HOME/.config_backups/$(date +%Y%m%d%H%M%S)"
mkdir -p $backup_dir

link_file() {
    local src=$1
    local dest=$2
    if [ -e "$dest" ]; then
        mv "$dest" "$backup_dir/"
    fi
    ln -s "$CONFIG_ROOT/$src" "$dest"
}

# Shell 配置
link_file "shell/bash/.bashrc" "$HOME/.bashrc"
link_file "shell/zsh/.zshrc" "$HOME/.zshrc"

# Neovim 配置
link_file "editors/nvim/init.lua" "$HOME/.config/nvim/init.lua"

echo "配置安装完成！旧文件备份至: $backup_dir"
