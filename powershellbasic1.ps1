#---
#Parameter block that defines variable x as mandatory 
Param(
    [string]$user = "Abi",
    [Parameter(Mandatory= $true, HelpMessage= "Enter a value for x")]
    [ValidateNotNullorEmpty()]
    [string] $x
)  

Write-Host 'This is my first script'
# [int32]$x = Read-Host 'Enter a value for x'
Write-Host 'Setting x = $x'
Write-Host 'Adding 10 to x'
$y = $x + 10

#---
# Ifelse, if (condtion=true) {Do thing number 1!} else {Do thing number 2}
if ($y -le 15) {
Write-Host 'This number is less than 15!'
}
elseif ($y = 15) {
    Write-Host "This number is 15"
}
else {
    Write-Host 'This number is more than 15!'
}
#---
# Enums allows to iterate stuff through a list, ForEach-Object has alias ForEach, when want to process pipeline objects
# 1 object at a time, [Object1][Object2][Object3] | ForEach-Object {[$CurrentObjectInPipeline] Do Something!}

1,2,3,4,5 | ForEach-Object { $S_ * 5}
# Gets content from a log file and uses list of server names with New-Item cmdlet, 
# but now the second $S_ is the output of the first NeW-Item cmdlet and so on, not the names in logs.txt
Get-Content logs.txt | ForEach-Object { New-Item -Path $Path -Name $S_ -ItemType File} | Where-Object {-Not $S_.speciaL}

# ForEach "for each ITEM in this group of things, do something"

[int32]$n = 1..10

foreach ($item in $n) {
    $file = "TestFile.$item.txt"
    New-Item $file -Path $Path
}

#---
# Arrays are essentialy lists which can be used to stre variables, below would be examples of arrays. Or creating an empty list of arrays.
$KBLIst = "KBXXX", "KBYYY", "KBZZZ" 
$arr = @()
$n = 1..5

# Some examples of calling array variables. 
$n.Count
5

$n
1
2
3
4
5

$n[1]
2

# Setting $x, now is technically an array of the services.
$s = Get-Service
#will output the name of the last service in the array we defined using Get-Service.
$s[-1].Name

#---
# Hashtables are essentialy dictionaries. 
$hash=@{Name=Abi; ID=$ID}
$hash2= [Ordered]@{
    Name=Abi
    ID=$ID
    Address=$Address

}

# Splatting allows us to create a hashtable with the parameters of cmdlet already defined, and then use that hashtable with the command.
# The below will pass the parameters in the hashtable to the Cmdlet. 

$Params= @{
    Name=Abi
    ID=$ID
    Address=$Address

}

Get-CmdletExample @Params

