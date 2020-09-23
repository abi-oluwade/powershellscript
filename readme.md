# PowerShell basics

- Just like "bash" PowerShell is a command shell and scripting language,
  however unlike bash it is based on Windows systems rather than Linux systems.

- PowerShell offers a command-line option (powershell.exe) and an integrated
  scripting environment option (ISE, powershell_ise.exe)

- Stored as ".ps1" files vs bash which is stored as ".sh" the only way to run
  ".ps1" is to right click and select "run with PowerShell",
  this helps prevent accidents.

- PowerShell includes many commands "out of the box"
  however many can also come from 3rd party vendors

- commands packaged as "Snapins" or "Modules"

- In addition, there is policy that restricts script execution.
  You can check this policy by running the:

````
"Get-ExecutionPolicy"
````

 command in PowerShell:
  - Restricted— No scripts are allowed. This is the default setting,
    so you will see it the first time you run the command.
  - AllSigned— You can run scripts signed by a trusted developer.
    With this setting in place, before executing, a script will ask you to confirm that you want to run it.
  - RemoteSigned— You can run your own scripts or scripts signed by a trusted developer.
  - Unrestricted— You can run any script you want.

### Snapins (legacy)
- Requires an installation and must be added before using commands.
(PowerShell will not automatically discover commands in snapins like in modules.)
- "Snapins" require an installation for the commands to be used.
- Will include supporting DLLs or applications and dependencies

### Modules
- Cmdlets and Functions can be a part of a module.
- Preferred packaging technique
- File based, so no installation typically required (quicker).
  Just extract contents of zip file
  which holds the commands and put it the appropriate directory.
  PowerShell will do the rest.
- Typically script files but can include binary elements.
- PowerShell autoloads modules as needed.
- An "alias" is an alternate name for a cmdlet, function, executable file, including scripts.
- 'Get-PSRepository' retrieves the place where the modules are stored and where more can be obtained.

# GET USED TO FIND-MODULE, INSTALL-MODULE, SAVE-MODULE

#### Find-Module = Finds modules in a repository that match specified criteria.

The Find-Module cmdlet finds modules in a repository that match the specified
criteria. Find-Module returns a PSRepositoryItemInfo object for each module it
finds. The objects can be sent down the pipeline to cmdlets such as Install-Module.

#### Install-Module = Downloads one or more modules from a repository, and installs them on the local computer.

The Install-Module cmdlet gets one or more modules that meet specified criteria
from an online repository. The cmdlet verifies that search results are valid
 modules and copies the module folders to the installation location.
 Installed modules are not automatically imported after installation.
 You can filter which module is installed based on the minimum, maximum,
 and exact versions of specified modules.

#### Save-Module = Saves a module and its dependencies on the local computer but doesn't install the module.

Save-Module downloads and saves the most current version of a module.
The files are saved to a specified path on the local computer.
The module isn't installed, but the contents are available for inspection by an
 administrator. The saved module can then be copied into the appropriate
 $env:PSModulePath location of the offline machine.

### PowerShell Cmdlets

- Cmdlets are "commands" that allow us to use the modules and snapins.
- A "cmdlet" is a PowerShell command with a predefined function,
  similar to an operator in a programming language. Here are some key things to
  know about cmdlets:
- There are "System", "User" and "Custom" Cmdlets
- Cmdlets outputs results as an object or as an array of objects.
- Cmdlets are case INsensitive.
- If you want to use several cmdlets in one string, you must separate them
  with a semicolon (;).

(Example)
```
- Running 'Get-Module -ListAvailable' will list all the module paths and the modules
stored in those paths, as well as detailing the ExportedCommands (Cmdlets) to use the modules.
Again, a module is typically script or binary(?).

- Running 'Stop-Service -Name "nordvpn-service"' would be the syntax to stop nord-vpn
```


### Cmdlet Format

- A cmdlet always consists of a verb (or a word that functions as a verb) and
  a noun, separated with a hyphen (the “verb-noun” rule). For example,
  some of the verbs include:
  - Get — To get something
  - Set — To define something
  - Start — To run something
  - Stop — To stop something that is running
  - Out — To output something
  - New — To create something (“new” is not a verb, of course, but it functions as one)

- So an example the following Cmdlets commands that could be executed: "Get-Process", "Stop-Service"
-  You can list all cmdlets by executing the "Get-Help -Category "cmdlet"
