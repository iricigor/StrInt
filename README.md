
# StrInt module README

PowerShell module `StrInt` is a demo module created to showcase how to create PS cmdlets (pronounced command-lets) in C# language.

[![Build Status](https://dev.azure.com/iiric/PS1/_apis/build/status/iricigor.StrInt?branchName=master)](https://dev.azure.com/iiric/PS1/_build/latest?definitionId=49&branchName=master)

## Module commands

This module is created just for learning purposes, but it's sub goal is to enable mathematical operations over integers represented by strings.

It has following cmdlets:
- `Get-StrIntSum` - returns sum of given numbers
- `Get-StrIntProduct` - returns product (multiplication) of given numbers
- `Get-StrIntFibonacci` - returns n-th Fibonacci number
- `Get-StrIntSquare` - returns square of given numbers
- `Get-StrIntFactorial` - returns factorial (n!) of given numbers
- `Get-StrIntPalindromic` - determines if a number reads the same forwards and backwards

## Getting started

### From PS Gallery

### From GitHub

```
git clone https://github.com/iricigor/StrInt
cd StrInt
dotnet build
Import-Module ./bin/Debug/netstandard2.0/StrInt.dll -Force
```

## A.I.

🧠 Fun fact: All programming logic in this module (helper.cs, Pester tests) is created by **ChatGPT!**
Read more about it [here](https://openai.com/blog/chatgpt/) or [try it yourself](https://chat.openai.com/)!

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
