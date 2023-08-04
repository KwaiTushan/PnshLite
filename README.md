# ProgynoshLite

New progynosh compiler for fish script with new features

## Dependence

Install fish, coreutils first

## Usage

1. Init your project

2. Write your functions in codes

3. Use pnsh b to build your product

## Documents

```
(./)app [-d/root=] [b/build, i/init, n/new, p/push, v/version, h/help/*]
    
    Args:

        -d/root=: Set root for project
    
    Actions:

        b/build: Build a product in the root directory
        Example: ./app -d ~/demo b product
        //This will build executable file "product" under ~/demo
        
        i/init: Init a project
        Example: ./app -d ~/demo i
        //This will create a new project at ~/demo
        
        n/new: Create a new function in project
        Example: ./app -d ~/pump toy/utils
        //This will create a new function at ~/pump/codes/toy/utils
        
        p/push: Push automatcally to remote git
        Example: ./app -d ~/demo push
        
        v/version: Show version
        
        h/help/*: Show this message
```
