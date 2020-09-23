# PowerShell Objects

PowerShell works with objects in a 'pipeline' and cmdlets (e.g Get-Process) output
objects. Functions and scripts also typically output objects. Cmdlets can also
accept objects as inputs as well. PowerShell comes with cmdlets that can already
work objects.

- Objects have properties:
  - Describe the object
  - Not every property is displayed by default
  - Often exposed via parameters
  - Some are read-only and some are modifiable.

- Objects have methods:
  - Actions the object can do or something done to the object. (e.g 'Service'
    would be an object that can be stopped or started. )
  - May use parameters.
  - Methods often exposed via cmdlets.
  - Can also be manually invoked on a per object basis.

## Master PowerShell by mastering objects in the pipline:
  - Remember objects can be inputs and outputs of cmdlets.

As a demonstration the 'psteachingtools' moudle was installed using find-module
and install-module.

'Get-Module -noun vegetable' shows us the modules contains functions that all
use the object vegetable.

Below is an example of some of the properties of the object that is outputted by
the cmdlet 'Get-Vegetable'
````
UPC     Count Name                 State    Color
---     ----- ----                 -----    -----
4078       12 corn                 Roasted  yellow
4064        4 tomato               Raw      red
4062       11 cucumber             Raw      green
4562       10 carrot               Raw      orange
4089       13 radish               Raw      red
````

'Get-Member' will retrieve the properties and methods of an object, it can be
piped to the end of another cmdlet, for example: Get-Vegetable | Get-Member
