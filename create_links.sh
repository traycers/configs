echo create symlinks for applications...
local=$(dirname "$(readlink -f "$0")")
echo create symlink for tmux
ln -s "$local/tmux/.tmux.conf" ~/.tmux.conf
echo create symlink for vim
ln -s "$local/vim/.vimrc" ~/.vimrc
echo create symlink for git
ln -s "$local/git/.gitconfig" ~/.gitconfig
