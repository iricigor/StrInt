
# StrInt module README

PowerShell module `StrInt` is a demo module created to showcase how to create PS cmdlets (pronounced command-lets) in C# language.

## Module commands

This module is created for learning purposes just, but it's sub goal is to enable mathematical operations over integers represented by strings.

It has following three cmdlets:
- `Get-StrIntSum` - returns sum of given numbers
- `Get-StrIntProduct` - returns product (multiplication) of given numbers
- `Get-StrIntFibonacci` - returns n-th Fibonacci number

## Getting started

TODO:

```
git clone . . .
Import-Module . . .
```

## Initial project creation

Run `dotnet` commands:

```PowerShell
$name = 'StrInt'
mkdir $name && cd $name
dotnet new -i Microsoft.PowerShell.Standard.Module.Template
dotnet new psmodule
dotnet new gitignore
dotnet build
```

Then, verify it in PowerShell:
```powershell
Import-Module ".\bin\Debug\netstandard2.0\$name.dll"
Get-Module $name
Test-SampleCmdlet 12
```

It should generate output similar to this:
```
FavoriteNumber FavoritePet
-------------- -----------
            12 Dog
```
