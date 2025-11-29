# Dotfiles

These are the significant settings for my Windows and Mac setup.

## Dev setup
On my home PC I use the default Windows Terminal, running WSL2. <br/>
For work I use Alacritty on Mac. <br/>

### VSCode
The most important VSCode Extensions are:
1. Vim - i use vim mode in VSCode. The vim speciffic settings in settings.json and keybindings.json are crucial to make it work more like Neovim.
2. Live Share - For those good live pair programming sessions
3. WSL - Make VSCode play nicer with a real OS
4. GitLens - "Who broke the code? (You - 2 weeks ago)"
5. ErrorLens - Puts the errors right in front of you.

### Neovim
* Maintained separately.
* See the .config-nvim [repo](https://github.com/Teddy-94/.config-nvim)

Language speciffic:
1. Pretty TypeScript Errors - Makes the gobbledygook that are the TypeScript errors readable...
2. ESLint and Prettier, always with project specified rulesets.
3. LSP plugins, stuff like the language support for whatever language I am writing in.

### WSL
* The WSL distro I use is Ubuntu, in which i pull the relevant dotfiles for Neovim, git, zsh, etc.

### Mac
* As a lifelong windows user, there was some friction going over to working on MacOS.
* Luckily, I found ways to make the OS behave more like I want to use it.
* Remappiing CMD and CTRL with Karabiner is one part.
* Karabiner also remaps Caps Lock to Backspace.
* So far, Alacritty is the only terminal emulator i have tried that respects the Karabiner remaps.
* [AltTab](https://alt-tab-macos.netlify.app/) is another key solution for enabling me to use MacOS. Alt-tabbing through my open windows is too engrained in my muscle memory. 

## Misc.
* One of the best life-hacks I have stumbeled upn is remapping the Caps-Lock key to something more useful. Many in the Vim/NeoVim community map it to Esc, but I have found it incredible to map CapsLock to Backspace.
* This is what the `capslock_to_backpace/capslock_to_backpace.reg` file does. I'm sure this can be somewhat easily achieved in Linux.
* On Mac this is achieved with Karabiner, see separate config file.
