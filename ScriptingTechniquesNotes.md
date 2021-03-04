## Powershell Scripting

### Scope
PowerShell scripts run in a given 'scopes'

At the top level level is the global scope, when the scope ends, everything defined by the scripts etc in
the global scope ends

Example, the script has a $varaible (or whatever we reference) and when executed PowerShell will look for that variable
in the current Scope, if it can find it great, if it can't it elevates the search for the $variable next to the Parent
scope, then Grandparent and so on till it finds what was referenced in the script, and if it does not find it
returns an error.

*PowerShell can only write or create in the current scope*

If a $variable is used on the script it should also be defined in that script. Some cmdlets have a -Scope parameter.

### PowerShell profile scripts
Profile scripts can setup hardcoded file paths so we can setup a session how we like,
$profile.CurrentUserAllHosts , can be used to apply the profile to all hosts such as PowerShellISE,VScode, we would have
to create the directory aswell as the ps1 file for the profile.


### Basic Script
- Parameterizes to avoid hard coding, no credentials.  
- Don't use aliases
- Use full cmdlet and parameter names
## Examples of below techniques in powershellbasic1.ps1 script
### If-else statements

If (<some condition is true>) {
  <do something>
ElseIf (<some other condtion is also true) {
  <do something else if this is true instead
}
Else {
    <do something else if none true>
  }
}

````
if (Test-Path c:\Documents\LogFiles.txt) {
  $data = Get-Content c:\Documents\LogFiles.txt
}
else {
  Write-Host "This path/file does not exist."
}
````

### Enumerations (Iterate)
Used to do tasks for each object in the pipeline to be processed one at a time, the first example is the "ForEacch-Object" cmdlet
````
2,5,6,7 | ForEach { $_ * 3}
````
"$_" = Represents the current object in the pipeline. So if used again the value would change to the previous
cmdlet output variable.

````
$n = 1...10
foreach ($item in $n) {
  $file = "TestFile-$item.txt"
  New-Item $file
}
````

### Arrays (Lists)
Is a collection of things, such as a list that is created automatically
- $arr = @() is the syntax to create an empty Arrays
- We may want to do this so we can add an item to the array
- $arr += 100 | Now has 100 as a value.
-$b = "abi", "mum", "dad" | This  is also an array since separated by commas.

examples
````
$n = 1..5

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

$s = Get-service, $s now is technically an array of the services.
$s[-1].Name, will output the name of the last service in the array we defined using Get-Service.

````
### Hashtables (Dicts)

Collection of Key:Value pairs.
