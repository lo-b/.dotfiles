<p align="center">
  <img src="banner.png" alt=".dotfiles">
</p>

<p align="center">
Repo containing my configuration files.
</p>

![Opening a NestJS project file using nnn, nvim & telescope](https://i.imgur.com/WKd4tVB.gif)
<sub>Opening a NestJS project file using nnn, nvim & telescope.</sub>

# Contents

1. [Getting Started](#getting-started)
    1. [Neovim](#neovim)
        1. [General](#general)
        2. [Intellisense](#intellisense)
2. [Usage](#usage)

# Getting Started

Below are the prerequisites and setup per (config) folder where necessary.

## Neovim

After stowing `nvim` (see [Usage](#Usage)), installing the LSP servers below
and running `:PlugInstall` in neovim, supported languages & files should be:
  - Vim configuration files
  - Dockerfiles
  - Ansible (y[a]ml files)
  - LaTeX
  - JavaScript
  - TypeScript
  - Python
  - Lua
  - Rust
  - java

### General

Make sure you have the following dependencies:

  - [Packer](https://github.com/wbthomason/packer.nvim)
  - [pynvim](https://github.com/neovim/pynvim)
  - [nerd-fonts-jetbrains-mono](https://www.nerdfonts.com/font-downloads)
### Intellisense

For intellisense to work, install the following language servers that implement
the LSP protocol:
  - [vimls](https://github.com/iamcco/vim-language-server)
  - [dockerls](https://github.com/rcjsuen/dockerfile-language-server-nodejs)
  - [ansible language server](https://github.com/ansible/ansible-language-server)
  - [texlab](https://github.com/latex-lsp/texlab)
  - [tsserver](https://github.com/typescript-language-server/typescript-language-server)
  - [pyright](https://github.com/microsoft/pyright)
  - [sumneko/lua-language-server](https//github.com/sumneko/lua-language-server)
  - [rust-analyzer](https://github.com/rust-analyzer/rust-analyzer)

# Usage

Stow is used to create symlinks, just run `stow <directory>` from within the
repo directory, e.g. `stow nvim`.  This will stow the contents of the `nvim`
directory one directory up and create the necessary symlinks.

>💡 Clone the repo from within your home folder, resulting in
`$HOME/.dotfiles`. This ensures that symlinks to (a config file in) `<folder>`
are in the location where a program is expecting it's config files.



In my case, I cloned the repo into `$HOME/.dotfiles`. Running the above command
will result in `$HOME/.config/nvim -> $HOME/.dotfiles/nvim/.config/nvim` (a
symlink in the `.config` folder -- nvim -- pointing to the `nvim` folder in the
dotfiles repo).
