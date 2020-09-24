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

As a demonstration the 'psteachingtools' module was installed using find-module
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
piped to the end of another cmdlet, for example:
````
Get-Vegetable | Get-Member
````
TypeName indicates the object, in this case 'Vegetable'.

Now we know the object type, we can manipulate the outputted objects further using
cmdlets, for example the 'Select-Object' cmdlet which works with any type of object.

So for example:
````
Get-Vegetable | Select-Object -property Name,Count,
````

This will return back the outputs and will allow us to specify the properties of
the outputted objects we want to see.

A primary use of 'Get-Member' is to recognise the property names which we can then use
with the other cmdlets to filter what we want accurately.

Another example is:
````
Get-Vegetable | Select-Object -First -Property *
````
Will show only the first object with all the associated properties of the object.
