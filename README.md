# Assembly-x86

Folder created with the objective of organizing the main codes focused on the discipline of software infrastructure

# Running asm files:
    nasm -f bin archive.asm -o binaryArchive.bin  // Creating the executable as a function of the binary file
    qemu-system-i386 binaryArchiev.bin            // Running through a virtual machine (For security reasons)
    
# Bootloader Signature:                           
    //  We need to run the asm code in qemu    
    org 0x7c00;
    jmp 0x0000:start
     ~ code ...
    times 510-($-$$) db 0                
    dw 0xaa55

# ASM INTERRUPTS
    -> https://www.cin.ufpe.br/~eaa3/Arquivos/Assembly/interrupcoes_pc.pdf
    -> https://pt.wikibooks.org/wiki/Programar_em_Assembly_com_GAS/Interrupções_do_BIOS

#Para instalar o nasm e o qemu: (os pcs do cin já possuem eles)
No terminal:#
    sudo apt-get install nasm
    sudo apt-get install qemu
