sudo apt update && sudo apt upgrade -y

sudo apt install -y curl gnupg
curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > bazel.gpg
sudo mv bazel.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list


sudo apt update && sudo apt install -y bazel
sudo apt update && sudo apt full-upgrade -y


bazel --version  # 1.0.0

# Bazel install from binary
sudo apt install -y g++ unzip zip

if [ ! -f bazel-6.0.0-pre.20211025.1-installer-linux-x86_64.sh ]
then
  echo "No Bazel installer, downloading:"
  wget https://github.com/bazelbuild/bazel/releases/download/6.0.0-pre.20211025.1/bazel-6.0.0-pre.20211025.1-installer-linux-x86_64.sh
else
  echo "Existing Bazel installer found."
fi

sudo chmod +x bazel-6.0.0-pre.20211025.1-installer-linux-x86_64.sh

bash bazel-6.0.0-pre.20211025.1-installer-linux-x86_64.sh --user

echo 'export PATH="$PATH:$HOME/bin"' >> ~/.bashrc

