# Gets the drive inforation then pipes it to 'Select-Object, Hashtable is then used to represent size in GB
# Get-WmiObject -Class Win32_logicaldisk |
# Select-Object -Property Name, @{Name = 'FreesSpaceGB' ; Expression = {$_.FreeSpace/1GB}} |

$hash= @{
	Class = win32_logicaldisk;
	Commputername = localhost
	
}

Get-WmiObject @hash