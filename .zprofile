. "$HOME/.cargo/env"

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"

# wabt(wasm tool)
export PATH="$HOME/pj/wabt/build:$PATH"

# golang
export PATH=$PATH:$HOME/go/bin

# n, node, npm
export N_PREFIX=$HOME/n
export PATH=$PATH:$N_PREFIX/bin:$HOME/.npm-global/bin 

# GUI
export DISPLAY=$(route.exe print | grep 0.0.0.0 | head -1 | awk '{print $4}'):0.0

# python(pip)
export PATH="$HOME/.local/bin:$PATH"

# Add .NET Core SDK tools
export PATH="$PATH:$HOME/.dotnet/tools"
