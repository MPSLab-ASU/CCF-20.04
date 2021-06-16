# CCF 20.04

## How to install

### Disclaimer on building from source
CCF 20.04 does not require you to have sudo privileges to install. Because of this, you must set up your environment such that you can build binaries from source.

If you have set your environment properly, then you can skip to section "Editing `install.sh`". If not, continue following the instructions below.

//TODO

### Editing `install.sh`
Open `install.sh` using your preferred text editor, and go to line 5 (e.g the line with `install_path=""`). Add the complete path of where you would like to install your binaries in between the quotation marks. Afterwards, save the file and run the command `bash install.sh`. This should allow you install CCF 20.04. 
