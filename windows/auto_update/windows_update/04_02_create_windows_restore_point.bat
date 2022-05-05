REM This script need to run in an elevated window.


REM Step 1: allow backup to happen less than 1440 minutes.
REM by edit Windows Registry

REM Method 1: import reg file using regedit (worked)
REM regedit.exe /s 04_01_change_windows_restore_frequency.reg

REM Method 2: add value/data under a key directly using reg (worked)
Reg Add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v SystemRestorePointCreationFrequency /t REG_DWORD /d 2 /f

GOTO comment
Method 3: Use powershell (not verified)

# Create new items with values
New-ItemProperty -Path 'HKCU:\Software\NewTestKey' -Name  'TestValue' -Value '1' -PropertyType 'DWORD' –Force
# Get out of the Registry
Pop-Location
:comment



REM Step 2: Create Windows Restore Point
REM ref: https://www.winhelponline.com/blog/create-system-restore-point-script-windows-10-8-7-vista-xp/#systemrestorepointcreationfrequency

REM Method 1: Use PowerShell (worked)
REM PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -NoExit -Command "Checkpoint-Computer -Description "(Get-Date) Before Windows Update" -RestorePointType "MODIFY_SETTINGS"; " ' " -Verb RunAs}"

REM Method 2: Use wmic (worked)
Wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "%DATE% %TIME% Before Windows Update", 100, 12
