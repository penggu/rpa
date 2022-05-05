REM There are 2 ways to launch the Windows Update GUI

REM Method 1: Windows Command Prompt (admin or non-admin)
control update

REM Method 2: Win+R
REM Then type "ms-settings:windowsupdate"

GOTO end_of_comment
<#
Method 3: Use usoclient commands
(don't know if it works or not)
(I tried them but there was NO output at all, so I am not 
sure if they worked or not)
usoclient startscan
usoclient startdownload
usoclient startinstall
usoclient restartdevice
usoclient scaninstallwait
#>
:end_of_comment
