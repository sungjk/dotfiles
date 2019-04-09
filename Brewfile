tap 'caskroom/cask'
tap 'caskroom/fonts'
tap 'caskroom/versions'
tap 'homebrew/core'
tap 'homebrew/services'
tap 'pivotal/tap'

cask_args appdir: '/Applications'

brew 'zsh'
brew 'zsh-autosuggestions'
brew 'zsh-syntax-highlighting'
brew 'zsh-completions'

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew 'coreutils'
# Install Bash 4.
brew 'bash'
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew 'findutils'
# Install some other useful utilities like `sponge`.
brew 'moreutils'

brew 'git'
brew 'git-flow'
brew 'openssl'
brew 'mackup'
brew 'tree'
brew 'telnet'
brew 'tcpdump'
brew 'wget'
brew 'watch'

# Install more recent versions of some macOS tools.
brew 'grep'
brew 'openssh'
brew 'screen'
brew 'php'

# Install font tools.
brew 'woff2'
cask 'font-source-code-pro'

# Dev
cask 'java8'
brew 'gradle'
brew 'maven'
brew 'jhipster'
brew 'kotlin'
brew 'sbt'
brew 'scala'
brew 'python3'
brew 'pyenv-virtualenv'
brew 'ruby'
brew 'rbenv'
brew 'elasticsearch'
brew 'logstash'
brew 'kibana'
brew 'kubectl'
brew 'kubernetes-cli'
brew 'apache-spark'

brew 'nvm'
brew 'node@10', args: ['with-npm']
brew 'yarn'

brew 'mongodb', restart_service: true
brew 'mysql', restart_service: true
brew 'sqlite'

# Apps
cask 'atom'
cask 'docker'
cask 'dropbox'
cask 'google-chrome'
cask 'intellij-idea'
cask 'iterm2'
cask 'postman'
cask 'slack'
cask 'sourcetree'
cask 'wireshark'
cask 'tunnelblick'
