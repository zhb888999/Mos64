boot.bin: boot.asm
	nasm boot.asm -o boot.bin
boot.img:
	bximage -mode=create -fd=1.44M boot.img -q
img: boot.bin boot.img
	dd if=boot.bin of=boot.img bs=512 count=1 conv=notrunc
run: img
	bochs -f .bochsrc
clean:
	rm -rf boot.bin boot.img

