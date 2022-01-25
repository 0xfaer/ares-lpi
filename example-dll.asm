format PE GUI 4.0 DLL
entry DllEntryPoint

include 'INCLUDE/win32ax.inc'
section '.text' code readable executable

proc dwMain
 mov eax, TRUE
 ret
endp

proc DllEntryPoint hinstDLL,fdwReason,lpvReserved

  CMP [fdwReason], 1
  JNE .sai

  invoke CreateThread,NULL,NULL,dwMain,NULL,NULL,NULL;

  .sai:

    mov eax, TRUE
    ret
endp

section '.idata' import data readable writeable

  library kernel,'KERNEL32.DLL',\
      user,'USER32.DLL'

  import kernel,\
    CreateThread, 'CreateThread'


section '.reloc' fixups data readable discardable
