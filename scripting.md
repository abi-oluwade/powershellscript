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
