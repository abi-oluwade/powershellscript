# Putting windows PowerShell to work

### Objectives.
1. Role of "objects" in PowerShell in a pipeline
2. How does a pipeline work.
3. How to use formatting Cmdlets
4. Discover how to use background jobs.

### Where do commands come from?
- Capability of getting 3rd party commands will be useful on the job. They are
packaged as "snapins" or "modules"

#### Snapins (legacy)
- Snapins require an installation for the commands to be used.
- Will include supporting DLLs or applications and dependencies

#### Modules
- Preferred packaging technique
- File based, so no installation typically required (quicker). Just extract contents of zip file
which holds the commands and put it the appropriate directory. Powershell will do the rest.
- Typically script files but can include binary elements.
- PowerShell autoloads modules as needed.

#### Useful commands examples
````
psversiontable -  Tells you PowerShell version.
Get-PSSnapin - Will show all currently loaded snapins
Add-PSSnapin quest*
````
