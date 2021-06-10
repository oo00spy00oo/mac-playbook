install:
	ansible-playbook playbooks/install.yml --ask-become

.PHONY: symlink

symlink: oh-my-tmux-symlink zprezto-symlink yabai-symlink skhd-symlink starship

zprezto-symlink:
	# Default mapping from: ${HOME}/.zprezto/runcoms/zpreztorc
	cd && ln -s -f ${HOME}/.config/zsh-config/zsh/.zpreztorc

# Change nvim symlink
nvim-symlink:
	mkdir -p ${HOME}/.config/nvim

	cd ~/.config/nvim && \
	ln -s -f ${HOME}/.config/zsh-config/.config/nvim/configs && \
	ln -s -f ${HOME}/.config/zsh-config/.config/nvim/init.vim

# Language
go:
	# https://medium.com/@jimkang/install-go-on-mac-with-homebrew-5fa421fc55f5
	brew install golang
	mkdir -p $HOME/go/{bin,src,pkg}
	# Setup env (in .bash_profile)

kube-aliases:
	wget https://raw.githubusercontent.com/ahmetb/kubectl-alias/master/.kubectl_aliases -O ~/.kubectl_aliases

update:
	# Submodule update from remote
	git submodule update --remote --merge

	# zinit-update
	zinit self-update