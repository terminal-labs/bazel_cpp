sudo apt update && sudo apt upgrade -y

# Bazel install from apt repo
sudo apt install -y curl gnupg
curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > bazel.gpg
sudo mv bazel.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list

sudo apt update && sudo apt install -y bazel
sudo apt update && sudo apt full-upgrade -y

# Add to bash completion
source /root/.bazel/bin/bazel-complete.bash
# Show bazel version
bazel --version
