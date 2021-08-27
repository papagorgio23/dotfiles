PYTHON_VERSION := 3.9.0

.PHONY: homebrew terminal cli cli_upgrade apps dotfiles language_servers setup_rust gcloud_sdk setup_pyenv

homebrew:
	cd
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

terminal:
	cd
	xcode-select --install
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
	ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

cli:
	brew install tmux
	brew install pyenv
	brew install kubectl
	brew install helm
	brew install exa
	brew install node
	brew install npm
	brew install ctags
	brew install bat
	brew install openjdk
	brew install rg
	brew install cmake
	brew install opencv
	brew install terraform
	brew install terraform-docs
	brew install gradle
	brew install gradle-completion
	brew install awk
	brew install go
	brew install jq
	brew install llvm
	brew install pandoc
	brew install shellcheck

cli_upgrade:
	brew upgrade tmux
	brew upgrade pyenv
	brew upgrade kubectl
	brew upgrade helm
	brew upgrade exa
	brew upgrade node
	brew upgrade npm
	brew upgrade ctags
	brew upgrade bat
	brew upgrade openjdk
	brew upgrade rg
	brew upgrade cmake
	brew upgrade opencv
	brew upgrade terraform
	brew upgrade terraform-docs
	brew upgrade gradle
	brew upgrade gradle-completion
	brew upgrade awk
	brew upgrade go
	brew upgrade jq
	brew upgrade llvm
	brew upgrade pandoc
	brew upgrade shellcheck

apps:
	brew install iterm2
	brew install slack
	brew install keeper-password-manager
	brew install alfred
	brew install spectacle
	brew install docker
	brew install r
	brew install rstudio
	brew install google-chrome
	brew install intellij-idea
	brew install clion
	brew install google-backup-and-sync
	brew install gpg-suite-no-mail
	brew install spotify
	brew install visual-studio-code
	brew install zoom

dotfiles:
	mkdir code && cd code
	git clone https://github.com/papagorgio23/dotfiles.git
	ln -s -f ~/code/dotfiles/.vimrc ~/.vimrc
	ln -s -f ~/code/dotfiles/.zshrc ~/.zshrc
	ln -s -f ~/code/dotfiles/.tmux.conf ~/.tmux.conf
	ln -s -f ~/code/dotfiles/coc-settings.json ~/.vim/coc-settings.json
	ln -s -f ~/code/dotfiles/.gitconfig ~/.gitconfig
	ln -s -f ~/code/dotfiles/Makevars ~/.R/Makevars
	ln -s -f ~/code/dotfiles/.vimrc ~/.ideavimrc

language_servers:
	npm install -g dockerfile-language-server-nodejs
	npm i -g bash-language-server

setup_rust:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	rustup component add rls rust-analysis rust-src

gcloud_sdk:
	curl https://sdk.cloud.google.com | bash

setup_pyenv:
	CFLAGS="-I$(brew --prefix openssl)/include -I$(brew --prefix readline)/include -I$(xcrun --show-sdk-path)/usr/include" \
	LDFLAGS="-L$(brew --prefix openssl)/lib -L$(brew --prefix readline)/lib -L$(xcrun --show-sdk-path)/usr/lib" \
	pyenv install -v $(PYTHON_VERSION)
	pyenv global $(PYTHON_VERSION)
