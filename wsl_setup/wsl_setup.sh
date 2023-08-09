sudo apt-get update

# Helix requirements
# Needs gcc
sudo apt install build-essential

# Rust toolchain 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Helix
git clone https://github.com/helix-editor/helix
cd helix
cargo install --path helix-term --locked
ln -s $PWD/runtime ~/.config/helix/runtime
cd ~

# Nodejs
sudo apt install nodejs
corepack enable
corepack prepare pnpm@latest --activate

#ts-server
npm install -g typescript-language-server typescript
