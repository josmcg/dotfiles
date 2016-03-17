# ~/.bash_profile: executed by bash(1) for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/login.defs
#umask 022

# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# Capture shopt nullglob setting
prev_nullglob=$(shopt -p nullglob)
# bashd and bash_extrad rely on nullglob set
shopt -s nullglob

bashd_files=( ~/.bash.d/*.sh )
if [ ${#bashd_files[@]} -gt 0 ]; then
	for f in "${bashd_files[@]}"; do
		source $f
	done
fi
unset bashd_files

bash_extrad_files=( ~/.bash.extra.d/*/extra.sh )
if [ ${#bash_extrad_files[@]} -gt 0 ]; then
	for f in "${bash_extrad_files[@]}"; do
		source $f
	done
fi
unset bash_extrad_files

# Restore the shopt nullglob setting
$prev_nullglob
# Clean up
unset prev_nullglob

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi
