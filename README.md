# CCF 20.04

## Overview 

CCF (**C**GRA **C**ompilation **F**ramework) is an end-to-end prototype that generates machine code for CGRAs (Coarse-Grained Reconfigurable Arrays) and simulate their performance. Through CCF, users can benchmark how CGRAs accelerate kernels designed for general-purpose applications. Currently, CCF 20.04 can accelerate over //TODO number of loops from three benchmark suites, Parboil, MiBench, and Rodinia. It is named CCF 20.04 because this framework has been built and verified on Ubuntu 20.04. 

This framework can be seen in three parts: Scheduling and Mapping, Instruction Generation, and Simulation. The Scheduling and Mapping part of CCF is built upon the foundations of the cross-compiler LLVM 13, and the Simulation part of CCF is built upon the cycle-accurate computer architecture simulation gem5. Instruction Generation is what bridges the two parts together.

## How to install

### Disclaimer on building from source
CCF 20.04 does not require you to have sudo privileges to install. Because of this, you must set up your environment such that you can build binaries from source.

If you have set your environment properly, then you can skip to section "Editing `install.sh`". If not, continue following the instructions below.

### How to build from source

In order to build for source, you need to create a directory where you will store the CCF 20.04 binaries. We will assume that you would like to make said directory in your root directory. We will also name that directory as `sw`, and we will create it using the command below.

```
cd ~
mkdir sw
```

After making this directory, we now need to change our environment variables such that BASH (or ZSH) is able to find the binaries installed in the directory. To do this, open the file `~/.bashrc` (or `~/.zshrc`) using your preferred text editor, and add the following lines:

```
export PATH="$SW/bin:$PATH"
expore LD_LIBRARY_PATH="$SW/lib:$LD_LIBRARY_PATH"
```

where `$SW` refers to the **full path** of directory `~/sw`. You can find the full path by running the following commands:

```
cd ~/sw
pwd
```

Once you have edited `~/.bashrc` (or `~/.zshrc`), run `source ~/.bashrc` (or `source ~/.zshrc`).

You have made the necessary changes to your environment and are now able to install CCF 20.04.

### Editing `install.sh`
Open `install.sh` using your preferred text editor, and go to line 5 (e.g the line with `install_path=""`). Add the complete path of where you would like to install your binaries in between the quotation marks. Afterwards, save the file and run the command `bash install.sh`. This should allow you install CCF 20.04. 
