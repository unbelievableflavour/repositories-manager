# Repositories
Manager for your apt repositories

![Screenshot](https://raw.githubusercontent.com/bartzaalberg/repositories-manager/master/screenshot.png)

### Simple App for elementary OS

A Vala application to manage your repositories in an interface

## Installation

### Dependencies

These dependencies must be present before building
 - `valac`
 - `gtk+-3.0`
 - `granite`

 You can install these on a Ubuntu-based system by executing this command:
 
 `sudo apt install valac libgtk-3-dev libgranite-dev`


### Building
```
mkdir build
cd build
cmake ..
make
```

### Installing
`sudo make install`

### Running
To run, run the following command. Or just search for repositories in your launcher and open it from there
`./com.github.bartzaalberg.repositories-pkexec`
