# dotfiles

These are my dotfiles.

## Install

ansible-playbook -i ./ansible/hosts.yml --ask-become-pass --become-user=$user ./ansible/dot_files.yml

## Included configurations

- git
- bash
- tmux
- Vim
- Visual Studio Code
- Transmission

## Todo

Something wrong with tmp

- [ ] fix install tmux plugins manager

I need configure to install some applications from Github.

- [x] search an link to download from api github
- [ ] download binaries
- [ ] implement an installation from sources in docker( for some apps )
- [ ] implement an installation
