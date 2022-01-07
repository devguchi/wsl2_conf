## ArchLinux on WSL2
- https://github.com/yuk7/ArchWSL
  - [日本語のREADME](https://github.com/yuk7/ArchWSL/blob/master/i18n/README_ja.md)

## インストール後最初にやること
- https://www.asobou.co.jp/blog/web/archilinux-on-wsl2

### Mirror listの変更
```shell
sed -i.dist \
    -e 's/^Server/#Server/g' \
    -e 's!#Server = \(https\?://.*\?\.jp\)!Server = \1!g' \
    /etc/pacman.d/mirrorlist
```

- 上記はもしかしたら、下記でよいかも？
  - 参照: [ミラーの最適化](https://qiita.com/MoriokaReimen/items/dbe1448ce6c0f80a6ac1#%E3%83%9F%E3%83%A9%E3%83%BC%E3%81%AE%E6%9C%80%E9%81%A9%E5%8C%96)

```shell
sudo pacman -g
```

### PGP鍵の設定

```shell
# keyringの初期化
pacman-key --init
 
# keyringのインストール
pacman-key --populate
 
# keyringの更新
pacman -Syy archlinux-keyring
```

### 作業用ユーザの作成

```shell
export Username=[Username]
 
# ユーザー作成
useradd -md /home/$Username $Username
 
# sudoの設定
cat <<EOT > /etc/sudoers.d/$Username
$Username ALL=(ALL) NOPASSWD: ALL
Defaults:%$Username !requiretty
Defaults:%$Username env_keep += SSH_AUTH_SOCK
EOT
 
chmod 440 /etc/sudoers.d/$Username
 
# パスワードの設定
passwd $Username
```

- Powershellで下記を実行し、デフォルトユーザを変更

```shell
PS> .\Arch.exe config --default-user [Username]
```

## 色々インストールする

```shell
> sudo pacman -Syyu
> sudo pacman -S git wget tree nodejs npm neovim zsh tig tmux exa bat openssh pkg-config gcc
> chsh -s /bin/zsh
> mkdir ~/.ssh && cd ~/.ssh && ssh-keygen
> chmod 600 id_rsa*
```

- 上記の鍵はgithubに登録する。

## Dot Filesの設定

```shell
> cd
> mkdir ~/.config
> git clone git@github.com:web3ten0/wsl2_conf.git
> ln -s wsl2_conf/.zshrc .
> ln -s wsl2_conf/.tmux.conf .
> tmux source-file ~/.tmux.conf
> ln -s wsl2_conf/.gitconfig .
> ln -s wsl2_conf/.tigrc .
> ln -s wsl2_conf/.vimrc .
> ln -s wsl2_conf/.zprofile .
> mkdir ~/.config/nvim
> ln -s wsl2_conf/.init.vim ~/.config/nvim/.
> sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
> nvim
```

- nvimが開いたら、`:PlugInstall`を実行。
  - [ここ](https://github.com/junegunn/vim-plug)参照。

## Dockerを作業用ユーザが操作できるようにする

```shell
> sudo gpasswd -a $(whoami) docker
> sudo chgrp docker /var/run/docker.sock
```

## node, npm, nのインストール・設定
- 作業用ユーザが操作できるようにする

```shell
> cd && mkdir .npm-global
> npm config set prefix=$HOME/.npm-global 
> npm i -g n
> vim .zprofile
```

- `.zprofile`に下記を追加

```.zprofile
export N_PREFIX=$HOME/n
export PATH=$PATH:$N_PREFIX/bin:$HOME/.npm-global/bin
```

- 続き

```shell
> n latest
> n lts
> sudo pacman -R nodejs npm
```

- 上記は、依存しているプログラムを消さないとダメだよエラーが出るので、全部消した上で、改めて上記を実行して、nodejsとnpmを削除する。
- `n`を入れているので、あとは`n`でNode.jsとnpmを入れる。
