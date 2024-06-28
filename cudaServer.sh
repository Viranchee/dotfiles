#! /bin/bash
mkdir -p AI
cd AI
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/vlotia/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo apt-get install build-essential

brew install fish uv
uv venv
source .venv/bin/activate.fish
uv pip install matplotlib torch --index-url https://download.pytorch.org/whl/cu121