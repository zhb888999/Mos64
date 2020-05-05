sudo pacman -S mask pkg-config nasm
tar -zxvf bochs-20200412.tar.gz
cd bochs-20200412
./configure --with-x11 --with-wx --enable-debugger --enable-disasm \
    --enable-all-optimizations --enable-readline --enable-long-phy-address \
    --enable-ltdl-install --enable-idle-hack --enable-plugins --enable-a20-pin \
    --enable-x86-64 --enable-smp --enable-cpu-level=6 --enable-large-ramfile \
    --enable-repeat-speedups --enable-configurable-msrs --enable-show-ips --enable-cpp \
    --enable-trace-linking --enable-fast-function-calls --enable-handlers-chaining \
    --enable-debugger-gui --enable-iodebug --enable-logging --enable-assert-checks \
    --enable-fpu --enable-vmx=2 --enable-svm --enable-3dnow --enable-alignment-check \
    --enable-monitor-mwait --enable-avx --enable-evex --enable-x86-debugger \
    --enable-pci --enable-usb --enable-voodoo --enable-es1370 --enable-gameport
cp misc/bximage.cpp misc/bximage.cc
cp iodev/hdimage/hdimage.cpp iodev/hdimage/hdimage.cc
cp iodev/hdimage/vmware3.cpp iodev/hdimage/vmware3.cc
cp iodev/hdimage/vmware4.cpp iodev/hdimage/vmware4.cc
cp iodev/hdimage/vpc-img.cpp iodev/hdimage/vpc-img.cc
cp iodev/hdimage/vbox.cpp iodev/hdimage/vbox.cc
make
sudo make install
