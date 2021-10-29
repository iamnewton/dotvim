# dotvim(1)

My personal ViM setup.

![](https://iamnewton.github.io/cdn/images/dotvim-screenshot.03.png)

_[Seti UI color scheme](https://github.com/jesseweed/seti-ui) with [Input Mono Condensed](https://input.djr.com) (patched as a [Nerd Font](https://www.nerdfonts.com))_

**N.B.** This project has a [Code of Conduct](./.github/CODE_OF_CONDUCT.md). By interacting with this repository, organization, and/or community you agree to abide by its terms.

## Installation

:warning: This will overwrite your existing `.vim` directory.

```bash
$ /bin/bash -c "$(curl -#fL https://raw.githubusercontent.com/iamnewton/dotvim/main/bin/dotvim)"
```

### Requirements

Ensure that you have the following dependencies installed on your system.  If you're on MacOS then you already have these, but a Linux system may not come with all.

* [curl](http://curl.haxx.se)
* [git](http://git-scm.com)

## Features

* Tabs over spaces, [don't come at me!](https://lea.verou.me/2012/01/why-tabs-are-clearly-superior/)
* Automatic install of all plugins and plugin manager on launch
* File explorer always open to showcase directory structure, but focus on primary window
* Syntax highlighting, over 50 languages, loaded on-demand
* Autocomplete "all the things", specifically Bash, CSS, Git, HTML, JS, JSON, SVG, YAML
* [Git](https://git-scm.com)/[GitHub](https://github.com) integration

## Plug Ins

* [vim-plug](https://github.com/junegunn/vim-plug) - plugin manager
* [NERDTree](https://github.com/preservim/nerdtree) - file explorer with plugins to decorate the source list with [icons](https://github.com/ryanoasis/vim-devicons) and [git status](https://github.com/Xuyuanp/nerdtree-git-plugin)
* [Polyglot](https://github.com/sheerun/vim-polyglot) - syntax highlighter
* [C.O.C.](https://github.com/neoclide/coc.nvim) - autocomplete/code complete
* [Fugitive](https://github.com/tpope/vim-fugitive)/[rhubarb.vim](https://github.com/tpope/vim-rhubarb) - Git and GitHub wrapper (respectively)

* * *

## Acknowledgements

Inspiration and code was taken from the following sources (in lexicographical order):

* [How to Turn Vim Into a Lightweight IDE by Dane Bulat](https://dane-bulat.medium.com/how-to-turn-vim-into-a-lightweight-ide-6185e0f47b79)
