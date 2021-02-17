# Linux Setup
**NOTE:** *heavily* personalized; target audience: me. Do everything here in and you should have an identical environment.

Glam Screenshots; weather API died :'(
![Screenshot](glam.png)
![Screenshot](glam2.png)

## Main configs and Look & Feel

### software deps and basic setup
- install arch, base, base-devel, linux, linux-firmware, grub, efibootmgr, networkmanager, openssh, git, etc...
- enable services:
  - `` systemctl enable NetworkManager ``
  - `` systemctl enable sshd ``
- make a user, log in and in ~ do:
  - Remove all of ~ with `` rm -rf * ``
  - Copy dots: `` git clone https://github.com/JSmol/dots.git . ``
  - Make dirs: `` mkdir downloads dev ``
- Install software: `` sh ~/.config/scripts/arch/install.sh `` **NOTE:** This installs a lot of stuff
- Change shell is automatic, otherwise run `` chsh -s `which fish` ``

### aur packages
- Install these aur packages; in ~/downloads do:
  - Spotify: `` git clone https://aur.archlinux.org/spotify.git ``
  - Compositer: `` git clone https://aur.archlinux.org/picom-ibhagwan-git.git ``
  - Prompt: `` git clone https://aur.archlinux.org/starship.git ``
  - Status Bar: `` git clone https://aur.archlinux.org/polybar.git ``
  - Widgets: `` git clone https://aur.archlinux.org/eww-git.git ``
    - **NOTE:** You may need to run `` rustup install nightly `` before `` makepkg `` for eww
- Use `` makepkg -sic `` in each directory

### python executables
- Ensure that `` ~/.local/bin `` is in the PATH variable! (*should* happen automatically on fish shell)

### vim & neovim
- pynvim and vim plug is installed
- In vim/nvim run `` :PlugInstall ``
- In nvim run `` :CocInstall coc-html coc-css coc-tsserver `` and `` :UpdateRemotePlugins ``

### pywal
- pywal is installed, populate `` ~/pictures/vibes `` with cool images and press F1 to switch between desktop themes randomly

### icons and cursor
- Icons: `` mkdir .icons ``
  - Run in ~/.icons: `` git clone https://github.com/EliverLara/candy-icons ``
  - If you want fancy cursor: https://github.com/ful1e5/Bibata_Cursor

### weather widget
- Weather widget; in /etc/systemd/system/ do:
- `` sudo vim weather.service `` and write
```
[Unit]
Description=Weather

[Service]
ExecStart=/home/josip/.config/misc/weather.sh
```
- `` sudo vim weather.timer `` and write 
```
[Unit]
Description=Weather Timer

[Timer]
OnBootSec=0min
OnCalendar=*-*-* *:00:00
Unit=weather.service

[Install]
WantedBy=timers.target
```
- Enable with: `` systemctl enable weather.timer ``
- make a token file `` weather.token `` in `` ~/.config/misc ``
  - weather api link: https://openweathermap.org/api
  - loc is set to calgary

## Workflow & Software tools

### gh cli
- Run `` gh auth login ``
  
### gcp sdk
- This link https://cloud.google.com/sdk/docs/install#linux

### firebase cli
- Run `` npm -g i firebase-tools ``
  - **NOTE:** At the time of writing, some features require downgrading to node12.
  - ie: Consider installing `` lts-erbium `` with nvm

