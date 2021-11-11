# Clone repo
if [ ! -d  examples ]
then
  echo "Cloning bazelbuild/examples tutorial repo:"
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
echo "Building stage2 example:"
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