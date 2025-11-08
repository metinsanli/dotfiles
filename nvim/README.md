## [neovim](https://github.com/neovim/neovim)

#### Linux/Debian
```sh
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz
```
```sh
sudo tar xzvf nvim-linux-x86_64.tar.gz -C /opt/
```
```sh
sudo update-alternatives --install /usr/local/bin/nvim nvim /opt/nvim-linux-x86_64/bin/nvim 100
```
> ###### editor'e de eklemek için (isteğe bağlı)
```sh
sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/nvim 50
```
```sh
sudo update-alternatives --set editor /usr/local/bin/nvim
```
> ###### mandatory ekleme (isteğe bağlı)
```sh
sudo ln -s /opt/nvim-linux-x86_64/share/man/man1/nvim.1 /usr/share/man/man1/nvim.1
```
```sh
sudo mandb
```
#### Windows
`winget install --id Neovim.Neovim`

## [init.vim](./init.vim)

#### Linux/Debian
```sh
mkdir -p $HOME/.config/nvim
```
```sh
ln -s $DOTFILES/nvim/init.vim $HOME/.config/nvim/init.vim
```

#### Windows

```powershell
New-Item -Type Directory -Force $env:LOCALAPPDATA\nvim
```
```powershell
New-Item -Type SymbolicLink -Target $env:DOTFILES\nvim\init.vim $env:LOCALAPPDATA\nvim\init.vim
```

## [vim-plug](https://github.com/junegunn/vim-plug)

#### Linux/Debian
```sh
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

#### Windows
```powershell
New-Item -Type Directory -Force $env:LOCALAPPDATA\nvim-data
```
```powershell
Invoke-WebRequest -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | New-Item $env:LOCALAPPDATA\nvim-data\site\autoload\plug.vim -Force
```

## [powerline-fonts](https://github.com/powerline/fonts)

#### Linux/Debian

```sh
sudo apt install fonts-powerline
```

#### Windows
```powershell
git clone https://github.com/powerline/fonts.git --depth=1
```
```powershell
cd fonts
```
```powershell
.\install.ps1
```

> ###### 'Windows Terminal/Settings/Defaults/Appearance' ayarları açılıp bir tane NF (NerdFont) yazı tipi seçilmeli.

## [coc-nvim](https://github.com/neoclide/coc.nvim)

> ###### coc-nvim eklentisi için [nodejs](https://deb.nodesource.com/) kurulmalı.

#### Linux/Debian
```sh
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo bash -
```
```sh
sudo apt-get install -y nodejs
```

##### Windows
```powershell
winget install --id OpenJS.NodeJS.LTS
```
