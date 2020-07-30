# dotfiles
> Ian's system configuration

## Modules

* [dotinit][dotinitUrl] - Init script for installing Ian's dotfiles system
  configuration
* [dotbrew][dotbrewUrl] - Ian's [Homebrew][brewUrl] configuration
* [dotapt][dotaptUrl] - Ian's Aptitude and [Snapcraft][snapUrl] configuration
* [dotnpm][dotnpmUrl] - Ian's [npm][npmUrl] configuration
* [dotzsh](https://github.com/ianwalter/dotzsh) - Ian's [zsh][zshUrl]
  configuration
* [dotvim](https://github.com/ianwalter/dotvim) - Ian's [vim][vimUrl]
  configuration
* [dotfonts][dotfontsUrl] - Ian's fonts configuration
* [dotgitconfig][dotgitconfigUrl] - Ian's [git][gitUrl] configuration
* [dotvscode][dotvscodeUrl] - Ian's [VS Code][vscUrl] configuration
* [dotiterm][dotitermUrl] - Ian's [iTerm2][itermUrl] configuration
* [dotgpg][dotgpgUrl] - Ian's GPG configuration

## Installation

1. Run [dotinit][dotinitUrl] install with your email address:

   ```console
   curl https://raw.githubusercontent.com/ianwalter/dotinit/master/install.sh | bash -s <email> <username>
   ```

2. Clone dotfiles repo and run installation script:

   ```console
   git clone git@github.com:ianwalter/dotfiles.git
   cd dotfiles && ./install.sh
   ```

## License

Hippocratic License - See [LICENSE][licenseUrl]

&nbsp;

Created by [Ian Walter](https://ianwalter.dev)

[dotinitUrl]: https://github.com/ianwalter/dotinit
[dotbrewUrl]: https://github.com/ianwalter/dotbrew
[dotaptUrl]: https://github.com/ianwalter/dotapt
[dotnpmUrl]: https://github.com/ianwalter/dotnpm
[dotgitconfigUrl]: https://github.com/ianwalter/dotgitconfig
[dotfontsUrl]: https://github.com/ianwalter/dotfonts
[dotvscodeUrl]: https://github.com/ianwalter/dotvscode
[dotitermUrl]: https://github.com/ianwalter/dotiterm
[dotgpgUrl]: https://github.com/ianwalter/dotgpg

[brewUrl]: https://brew.sh
[snapUrl]: https://snapcraft.io
[npmUrl]: https://www.npmjs.com/
[zshUrl]: https://www.zsh.org/
[vimUrl]: https://www.vim.org/
[gitUrl]: https://git-scm.com/
[vscUrl]: https://code.visualstudio.com
[itermUrl]: https://iterm2.com

[licenseUrl]: https://github.com/ianwalter/dotfiles/blob/master/LICENSE
