# Windows Config

These are the significant settings for my Windows setup.

## Dev setup
I use the default Windows Terminal, running WSL2 for the absolute majority of programming. <br/>
Most of the work happens in Neovim, but I also use VSCode/JetBrains for some things <br/>

### Neovim
* Maintained separately.
* See the .config-nvim [repo](https://github.com/Teddy-94/.config-nvim)

### VSCode
The most important VSCode Extensions are:
1. Live Share - For those good live pair programming sessions
2. WSL - Make VSCode play nicer with a real OS
3. GitLens - "Who broke the code? (You - 2 weeks ago)"
4. ErrorLens - Puts the errors right in front of you.
4. Themes: Catppuccin, Onehalf Dark, Tokyo Night, or Rose Pine, for example.


Language speciffic:
1. Pretty TypeScript Errors - Makes the gobbledygook that are the TypeScript errors readable...
2. ESLint and Prettier, always with project specified rulesets.
3. LSP plugins, stuff like the language support for whatever language I am writing in.

### WSL
* The WSL distro I use is Ubuntu, in which i pull the relevant dotfiles for Neovim, git, zsh, etc.

## Misc.
* One of the best life-hacks I have stumbeled upn is remapping the Caps-Lock key to something more useful. Many in the Vim/NeoVim community map it to Esc, but I have found it incredible to map CapsLock to Backspace.
This is what the `capslock_to_backpace/capslock_to_backpace.reg` file does. I'm sure this can be somewhat easily achieved in Linux. For Mac this can be achieved with Karabiner

