# Dotfiles

Repo containing all of my configuration files. For easily stowing of configs
clone the repo in `$HOME`.

Stow is used to create symlinks, just run `stow <directory>`, e.g. `stow nvim`.
This will stow the whole nvim directory one directory up from where the
dotfiles repo is cloned.  In case of my main system, the repo is cloned into
`/home/bram/.dotfiles` meaning the end result will be `nvim ->
../.dotfiles/nvim/.config/nvim` (a symlink, nvim, pointing to the latter
directory).

## Prerequisites

Some general dependencies:
  - [fzf](https://github.com/junegunn/fzf)
  - [ripgrep](https://github.com/BurntSushi/ripgrep)

Below are the prerequisites per (config) folder where necessary.

>💡 On Arch, pereferably install packages and language servers using _pacman_ instead of
'npm-installing', using scripts, etc.

#### Neovim

After stowing `nvim` and installing the LSP servers below, supported languages
& files should be: java, JavaScript, TypeScript, Dockerfile, Lua, Python and
LaTeX.

##### General

For python support install pynvim and set the global python environment
(/usr/bin/python).

##### Intellisense

For intellisense to work, install the following language servers that implement
the LSP protocol:
  - [sumneko/lua-language-server](https//github.com/sumneko/lua-language-server)
  - [tsserver](https://github.com/typescript-language-server/typescript-language-server)
  - [dockerls](https://github.com/rcjsuen/dockerfile-language-server-nodejs)
  - [vimls](https://github.com/iamcco/vim-language-server)
  - For java [CoC](https://github.com/neoclide/coc.nvim) is used since native
    LSP didn't work with debugging.
  - [texlab](https://github.com/latex-lsp/texlab) \
    TexLab only implements the LSP; to be able to build `.tex` files install
    _Tectonic_ and _biber_ to be able to create references and citations.
