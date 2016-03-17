
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

	# Install Vundle, because its self-updates don't work if managed in
	# another git repo
	if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
		git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	fi

	# Tell vim's Vundle to install all of the things
	vim +BundleInstall +qall
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

source ~/.bash_profile
