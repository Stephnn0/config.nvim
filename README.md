# config.nvim

This is my new neovim configuration.

It is a work in progress and will be updated as I learn more about neovim and vimscript.

## Description

Mason.nvim - Installers for LSP, Formatters, Linters, and etc.

Packer.nvim - Plugin Manager.

## Commands

- :Mason - Check Mason installations
- :PackerSync - Install Packages

## Recover

- delete binary
- :PackerInstall / PackerSync
- nvim

# Icons

- download hack nerd fonts

# Installation

(preferably compiled nvim from source, u need nvim +10 version)

1- copy project in ~/config/nvim

2- nvim (will download all packages)

3- Mason: (to install lsps) (go needs to be installed in ur system)

4- download, extract and copy nerd fonts to ~/Fonts (Hack.zip)

5- sudo apt-get install xclip (enable copy/paste buffers)

# Packages

- Package Manager: Packer
- Fuzzy Finder: Telescope
- Parser: Treesitter (highlighting, indenting)

- undo tree
- harpoon
- tpope/vim-fugitive
