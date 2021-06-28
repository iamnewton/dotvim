# dotvim(1)

My personal ViM setup.

**N.B.** This project has a [Code of Conduct](./.github/CODE_OF_CONDUCT.md). By interacting with this repository, organization, and/or community you agree to abide by its terms.

## Installation

:warning: This will overwrite existing `.vim` directory.

```bash
$ /bin/bash -c "$(curl -#fL https://raw.githubusercontent.com/iamnewton/dotvim/main/bin/install.sh)"
```

### Requirements

Ensure that you have the following dependencies installed on your system.  If you're on MacOS then you already have these, but a Linux system may not come with all.

* [curl](http://curl.haxx.se)
* [git](http://git-scm.com)

:exclamation: N.B. If you wish to [fork this project](https://github.com/iamnewton/dotvim/fork) and maintain your own dotfiles, you **MUST** substitute my username for your own in the above command and the variable (`$USERNAME`) found at the top of the `bin/install.sh` script.

## Features

* Tabs over spaces, [don't come at me!](https://lea.verou.me/2012/01/why-tabs-are-clearly-superior/)
* NERDTree always open, but focus on primary window

## Plug Ins

* [vim-plug](https://github.com/junegunn/vim-plug) - plugin manager
* [NERDTree](https://github.com/preservim/nerdtree) - file explorer with a few plugins to decorate the source list with [icons](https://github.com/ryanoasis/vim-devicons) and [git status](https://github.com/Xuyuanp/nerdtree-git-plugin)
*

#### Screenshot

![](https://iamnewton.github.io/cdn/images/dotvim-screenshot.02.png)

* * *

## Acknowledgements

Inspiration and code was taken from many sources, including (in lexicographical order):

* https://dane-bulat.medium.com/how-to-turn-vim-into-a-lightweight-ide-6185e0f47b79
