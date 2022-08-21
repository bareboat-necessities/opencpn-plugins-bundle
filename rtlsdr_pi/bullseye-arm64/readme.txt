cd
sudo apt-get -y install gettext
git clone https://github.com/seandepagnier/rtlsdr_pi
cd rtlsdr_pi/
mkdir build
cd build
cmake ..
make -j 4
