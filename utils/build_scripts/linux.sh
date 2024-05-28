#KabosuPrivate build script for linux
#Copyrights KabosuPrivate Network 2023

#Install dependences
sudo apt update && sudo apt install --yes git build-essential curl pkg-config libssl-dev libsodium-dev libunwind-dev liblzma-dev libreadline-dev libldns-dev libexpat1-dev doxygen graphviz libudev-dev libusb-1.0-0-dev libhidapi-dev xsltproc gperf autoconf automake libtool-bin

#Build and install cmake 3.17.3 from source
wget https://github.com/Kitware/CMake/releases/download/v3.17.3/cmake-3.17.3.tar.gz
tar -xvf cmake-3.17.3.tar.gz
cd cmake-3.17.3
./bootstrap
make -j4
sudo make install
cd ..

#Build and install boost 1.73.0 from source
wget https://boostorg.jfrog.io/artifactory/main/release/1.73.0/source/boost_1_73_0.tar.gz
tar -xvf boost_1_73_0.tar.gz
cd boost_1_73_0
./bootstrap.sh
./b2 -j4
sudo ./b2 install
sudo ./b2 headers
cd ..

#Build kabosuprivate from source
git clone https://github.com/KabosuPrivateNetwork/kabosuprivate --recursive
cd kabosuprivate
git submodule init
git submodule update
cmake .
make -j4
