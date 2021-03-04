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

#--- 
#Objects in the pipeline, we may want to specify our objects in the pipeline to have just the properties we want we may not neccassir be properties that are
# default avaliable in our commandlets, therefore we can create custom properties to be used later in the pipeline, $_. represent current object in pipeline
#New properties can be defined in the hashtable: @{Name='example';Expression={<code to do something>}}
Get-ChildItem C:\Users\skitz\DevOpsProjects -File |
Select-Object Name,LastWriteTime,
@{Name="Size";
Expression={$_.Length}},
@{Name="Age";Expression={(Get-Date) - $_.LastWriteTime}}|
Sort-Object Age -Descending|
Select-Object -first 10

#New-Object can also be used to specify the properties.
# A hashtable can be made to specifiy the custom properteies wanted that may not nessarcily be in the Get-ChildItem cmdlet, allowing use to write
# A custom object to the pipeline
$f = Get-ChildItem -Path C:\Users\skitz\DevOpsProjects -File
$n = Get-Date
foreach ($file in $f) {
    $h=@{
        Name = $file.name
        Modified = $file.LastWriteTime
        Size = $file.Length
        Age = $n - $f.LastWriteTime
    }
    New-Object psobject -Property $h
}
#--- 
# Try/Catch blocks are used for error handling, so below is example syntax, try to run some command that will create a terminating exception,
#Catch and handle any errors, There is the finally block that is optional and will run regardless. Error action stop required to force any errors to be terminating.
Try {
    <Some Code -ErrorAction Stop>
}
Catch {
    <the exception object: $_>
}

#--- 
#Demo
$a = 1..10
$a |
ForEach-Object {$_ *5} |
foreach ($item in $a) {
    $file = "SERVER.$a.txt"
    New-Item -Name $file -ItemType Directory

    
}
