# Windows Config

These are the significant settings for my Windows setup.

## Dev setup
I use the new Windows Terminal, and WSL2 for the absolute majority of programming. <br/>
Most of the work happens in VSCode, but I really enjoy trying out new things, and have experimented both with NeoVim and Helix. <br/>


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

## Misc.
* One of the best life-hacks I have stumbeled upn is remapping the Caps-Lock key to something more useful. Many in the Vim/NeoVim community map it to Esc, but I have found it incredible to map CapsLock to Backspace.
This is what the `capslock_to_backpace/capslock_to_backpace.reg` file does. I'm sure this can be somewhat easily achieved in Linux.

* The wsl_setup.sh contains some of the stuff I want installed in wsl. This is mainly the helix editor and its build dependencies, nodejs and pnpm via corepack, and the typescript lsp. This should be extended for each core dependency I install in wsl.