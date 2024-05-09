
Enable-LocalUser -Name Administrator


net user Administrator password

Rename-LocalUser -Name Administrator -NewName root

Write-Host "-------------------Enabled the root account-------------------------------"

$userName = Read-Host -Prompt "Enter the username"

$fullName = Read-Host -Prompt "Enter user's fullname"

$userPassword = Read-Host -Prompt "Enter user's password"

$securePassword = ConvertTo-SecureString -String $userPassword -AsPlainText -Force

New-LocalUser -Name $userName -FullName $fullName -Password $securePassword

Add-LocalGroupMember -Group "Users" -Member $userName

Write-Host "------------------------Created the new user-----------------------"


winget install --id 7zip.7zip --silent

winget install --id google.chrome --silent

winget install --id Mozilla.Firefox --silent

winget install --id Adobe.Acrobat.Reader.64-bit --silent

winget install --id Microsoft.Teams --silent

winget install Microsoft.Office --silent



Write-Host "---------All installations completed successfully.
---------"

$cdrivespace = Read-Host -Prompt "Enter C-drive space (250gb or 137gb): "

$sizeInBytes = [uint64]($cdrivespace.TrimEnd("gb")) * 1GB

Get-Partition -DriveLetter C | Resize-Partition -Size $sizeInBytes

new-partition -disknumber 0 -usemaximumsize -assigndriveletter | format-volume -filesystem NTFS -newfilesystemlabel "New Volume" -Force

Write-Host "--------------------Disk Partition is done--------------------------------"


Enable-Bitlocker -MountPoint "C:" -RecoveryPasswordProtector 
Enable-Bitlocker -MountPoint "D:" -RecoveryPasswordProtector


$NewHostname = Read-Host -Prompt "Enter the HOSTNAME"

Rename-Computer -NewName $NewHostname -Force

Write-Host "----------------------Changed the Hostname-----------------------------------"

$Workgroup = "WG"
Add-Computer -WorkgroupName $Workgroup -Force

Write-Host "------------Added to the workgroup. Restart required--------------------------"

Read-Host -Prompt "Press Enter to close."