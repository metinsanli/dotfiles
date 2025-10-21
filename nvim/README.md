## [neovim](https://github.com/neovim/neovim)

##### Linux
```bash
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz
sudo tar xzvf nvim-linux-x86_64.tar.gz -C /opt/
sudo update-alternatives --install /usr/local/bin/nvim nvim /opt/nvim-linux-x86_64/bin/nvim 100
```
> ==editor=='e de eklemek için (isteğe bağlı)
```sh
sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/nvim 50
sudo update-alternatives --set editor /usr/local/bin/nvim
```
##### Windows
`winget install --id Neovim.Neovim`

## [init.vim](./init.vim)

##### Linux
```sh
mkdir -p $HOME/.config/nvim
ln -s $DOTFILES/nvim/init.vim $HOME/.config/nvim/init.vim
```

##### Windows

```powershell
New-Item -Type Directory -Force $env:LOCALAPPDATA\nvim
New-Item -Type SymbolicLink -Target $env:DOTFILES\nvim\init.vim $env:LOCALAPPDATA\nvim\init.vim
```

## [vim-plug](https://github.com/junegunn/vim-plug)

##### Linux
```sh
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

##### Windows
```powershell
New-Item -Type Directory -Force $env:LOCALAPPDATA\nvim-data
Invoke-WebRequest -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | New-Item $env:LOCALAPPDATA\nvim-data\site\autoload\plug.vim -Force
```

## [powerline-fonts](https://github.com/powerline/fonts)

##### Linux

```sh
sudo apt install fonts-powerline
```

##### Windows
```powershell
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
.\install.ps1
```

> 'Windows Terminal/Settings/Defaults/Appearance' ayarları açılıp bir tane NF (NerdFont) yazı tipi seçilmeli.

## [coc-nvim](https://github.com/neoclide/coc.nvim)

> coc-nvim eklentisi için [nodejs](https://deb.nodesource.com/) kurulmalı.

##### Linux
```sh
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo bash -
sudo apt-get install -y nodejs
```

##### Windows
```powershell
winget install --id OpenJS.NodeJS.LTS
```
