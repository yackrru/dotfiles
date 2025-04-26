# Dotfiles
Personal dotfiles for macOS.

## Prerequirements
- [Homebrew](https://brew.sh/)

## Usage
Clone repository.
```bash
git clone https://github.com/ttksm/dotfiles.git
cd dotfiles
```
Install brews.
```bash
brew bundle
exec $SHELL -l
```
Initialize sdkman and anyenv.
```bash
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

BREW_BIN=$(brew --prefix)/bin
$BREW_BIN/anyenv install --init

exec $SHELL -l
```
Run install.sh until you see the finish message like "Finish!".
```bash
./install.sh
```

## Support programming language
- Go
  - [Native installation](https://go.dev/dl/)
- Node.js
  - nodebrew (Homebrew)
- Ruby
  - rbenv (Homebrew)
- JVM
  - SDKMAN (Native)

## Notes on gitconfig (optional)
- The username and email address that used at commit are defined as environment variables in `gituser.sh`.
