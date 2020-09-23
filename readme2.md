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
