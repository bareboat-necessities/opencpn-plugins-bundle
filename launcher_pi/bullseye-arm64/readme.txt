cd
sudo apt-get -y install libbz2-dev
git clone https://github.com/nohal/launcher_pi
cd launcher_pi/
mkdir build
cd build
cmake ..
make -j 4
