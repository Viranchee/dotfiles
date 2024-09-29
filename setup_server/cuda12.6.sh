wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/12.6.1/local_installers/cuda-repo-ubuntu2204-12-6-local_12.6.1-560.35.03-1_amd64.deb

sudo dpkg -i cuda-repo-ubuntu2204-12-6-local_12.6.1-560.35.03-1_amd64.deb
sudo cp /var/cuda-repo-ubuntu2204-12-6-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda-toolkit-12-6

fish_add_path /usr/local/cuda-12.6/bin
# PATH=/usr/local/cuda-12.6/bin:$PATH

sudo apt-get install -y nvidia-open