# Assembly-x86

Folder created with the objective of organizing the main codes focused on the discipline of software infrastructure

# Running asm files:
    nasm -f bin archive.asm -o binaryArchive.bin  // Creating the executable as a function of the binary file
    qemu-system-i386 binaryArchiev.bin            // Running through a virtual machine (For security reasons)
    
# Bootloader Signature:                           
    //  We need to run the asm code in qemu
    times 510-($-$$) db 0                
    dw 0xaa55

# INT 
    -> https://www.cin.ufpe.br/~eaa3/Arquivos/Assembly/interrupcoes_pc.pdf
