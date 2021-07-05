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
Run install.sh until you see the finish message like "Finish!".
```bash
./install.sh
```

## Support programming language
- Go
  - goenv (anyenv)
- Node.js
  - nodebrew (Homebrew)
- Python
  - pyenv (Homebrew)
- Ruby
  - rbenv (Homebrew)
- JVM
  - SDKMAN (Native)

## Notes on gitconfig
- The username and email address used at commit are defined as environment variables in commonrc.
