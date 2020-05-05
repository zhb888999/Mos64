loader.bin: loader.asm
	nasm loader.asm -o loader.bin
boot.bin: boot.asm boot.img
	nasm boot.asm -o boot.bin
boot.img:
	bximage -mode=create -fd=1.44M boot.img -q
img: boot.bin boot.img
	dd if=boot.bin of=boot.img bs=512 count=1 conv=notrunc
mount:
	sudo mount ./boot.img ./img -t vfat -o loop
umount:
	sudo umount ./img
run: boot.bin loader.bin
	sudo mount ./boot.img ./img -t vfat -o loop
	sudo cp loader.bin ./img
	sync
	sudo umount ./img
	bochs -f .bochsrc
clean:
	rm -rf boot.bin boot.img loader.bin

