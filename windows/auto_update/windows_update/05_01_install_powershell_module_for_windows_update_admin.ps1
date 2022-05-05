<##################################### 
1. Relax Powershell Execution Policy
#####################################>

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

<##################################### 
2. Install and import the pswindowupdate module 
#####################################>


Install-Module pswindowsupdate -Force 
Import-Module pswindowsupdate

<#
# Note: on Windows 11, the following attempts to automatically 
# answer "Yes" to a prompt on Powershell does NOT work
# 1. ECHO 'Y' | Install-Module pswindowsupdate
# 2. Command-Name -Force
# 3. Command-Name $ConfirmPreference = 'None'
# 4. Command-Name -Confirm:$false
#>
