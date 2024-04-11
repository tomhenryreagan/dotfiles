# dotfiles
home for my personal dotfiles 

## TODO
- Figure out host-specific configuration
- Resolve zsh conflict between laptop and desktop (desktop is in sync with remote; laptop is ahead)

## Usage with stow 
- This is meant to be used with GNU Stow
- The provided `makefile` handles the default usage
- Stow a particular package: `stow --verbose --target=$HOME <package>/`
- Inspired by [Bastian Venthur's Guide](https://venthur.de/2021-12-19-managing-dotfiles-with-stow.html)
