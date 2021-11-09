sudo apt update && sudo apt upgrade -y

# Bazel install from apt repo
sudo apt install -y curl gnupg
curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > bazel.gpg
sudo mv bazel.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list

sudo apt update && sudo apt install -y bazel
sudo apt update && sudo apt full-upgrade -y

# Show Bazel version, test bazel installation.
if ! command -v bazel &> /dev/null
then
  echo "Bazel install failed or bazel command is unavailable."
else
  echo "Successfully installed $(bazel --version)"
fi


### Tutorial test

# Clone repo
if [ ! -d  examples ]
then
  echo "Cloning bazelbuild/examples tutorial repo"
  git clone https://github.com/bazelbuild/examples
else
  echo "Tutorial repo bazelbuild/examples present."
fi

cd examples/cpp-tutorial

# Build stage1 example
echo "Building stage1 example:"
cd stage1
bazel build //main:hello-world
echo "Running stage1 example:"
bazel-bin/main/hello-world
echo "stage1 example dependency graph:"
bazel query --notool_deps --noimplicit_deps "deps(//main:hello-world)" \
  --output graph

# Build stage2 example
echo "Building stage1 example:"
cd ../stage2
bazel build //main:hello-world
echo "Running stage2 example:"
bazel-bin/main/hello-world
echo "stage2 example dependency graph:"
bazel query --notool_deps --noimplicit_deps "deps(//main:hello-world)" \
  --output graph

# Build stage3 example
echo "Building stage3 example:"
cd ../stage3
bazel build //main:hello-world
echo "Running stage3 example:"
bazel-bin/main/hello-world
echo "stage3 example dependency graph:"
bazel query --notool_deps --noimplicit_deps "deps(//main:hello-world)" \
  --output graph