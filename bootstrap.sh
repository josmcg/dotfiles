#!/bin/bash
#
# From https://github.com/mathiasbynens/dotfiles/blob/master/bootstrap.sh

cd "$(dirname "${BASH_SOURCE}")"
chmod 0755 .

function doIt() {
	# -u will skip files newer on the receiving end
	rsync --exclude ".gitmodules"           \
	      --exclude ".git/"                 \
	      --exclude ".DS_Store"             \
	      --exclude "bootstrap.sh"          \
	      --exclude "compare.sh"            \
	      --exclude "README.md"             \
	      --exclude "mailmate-keybindings/" \
	      -a -v -u . ~

	# Install Plug, because its self-updates don't work if managed in
	# another git repo
	if [ ! -e ~/.vim/autoload/plug.vim ]; then
		git clone https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim ~/.vim/\autoload/plug.vim
	fi

	# Tell vim's Plug to install all of the things
	vim +PlugInstall +qall
}


function miniconda(){
	wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
	chmod +x miniconda.sh
	bash miniconda.sh -b -p ~/anaconda3
	rm miniconda.sh
	echo "make sure to run a pip install "
}


if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
if [ ! -d  "~/anaconda3" ]; then
	read -p "anaconda is not installed, would you like to install miniconda (for linux only)? (y/n)" -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then 
		miniconda
	fi
fi
unset miniconda
if [ ! -d  "~/.oh-my-zsh" ]; then
	read -p "oh-my-zsh is not installed, would you like to install it? (y/n)" -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then 
		sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	fi
f
source ~/.zshrc
