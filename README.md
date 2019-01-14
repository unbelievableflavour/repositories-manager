# Repositories Manager
Manager for your apt repositories
 
<p align="center"> 
    <img  
    src="https://raw.githubusercontent.com/bartzaalberg/repositories-manager/master/screenshot.png" /> 
</p> 

### Repositories manager for elementary OS

A Vala application to manage your repositories in an interface

## Installation

As first you need elementary SDK 
 
 `sudo apt install elementary-sdk` 

### Dependencies

These dependencies must be present before building
 - `valac`
 - `gtk+-3.0`
 - `granite`

 You can install these on a Ubuntu-based system by executing this command:
 
 `sudo apt install valac libgtk-3-dev libgranite-dev`

### Building
```
meson build --prefix=/usr
cd build
ninja
```

### Installing
`sudo ninja install`
