# Script example to check hard drive space, and remove files if needed

$diskname = $env:SystemDrive

#Get-WmiObject -Class Win32_logicaldisk -Filter "DriveType =  3" |
#Select-Object @{Name =  $Computername : Expression = {$_.SystemName}},
#@{Name = "Free SpaceGB" : expression = { FreeSpace/10^(10)}


# Get-WmiObject -Class win32_logicaldisk -Filter "DriveType = 3" 
	# [string]$FreeSpace = Select-Object -Property FreeSpace | 
	# Write-Host -Object $FreeSpace

	# Expression to find the ammouunt of storage used and set it to GB frommm bytes
	# 0:N1 sets the number of decimals to use, and /GB sets it to display gigabyte
	Get-WmiObject -Class Win32_logicaldisk -Filter "DriveType = '3'" | 
Select-Object -Property DeviceID, DriveType, VolumeName, 
@{Name ='FreeSpaceGB'; Expression = {"{0:N1}" -f ($_.FreeSpace /1GB)}},
@{Name ="Capacity"; Expression = {"{0:N1}" -f ($_.Size/1GB)}} -outvariable $FreeSpaceGB
	
	$FreeSpaceGB = [string]$FreeSpaceStringGB


	Write-Host "This much space in GB" + $FreeSpaceStringGB