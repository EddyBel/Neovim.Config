<h1 align="center" >Install the C++ compiler</h1>

## Linux

In **Linux** this step is not necessary because a compiler is usually already integrated in the operating system.

To install the C++ compiler on Linux, there are several options depending on the distribution you use. A common option is to use the build-essential package, which includes the GCC compiler and other development tools.

To install it on Ubuntu, you can use the Ubuntu Software Center or the command:

```bash
sudo apt-get install build-essential
```

Another option is to use MinGW, which is a set of tools for compiling C and C++ programs on Windows, Linux and Mac OS X4. To install it on Windows, you can follow the steps in this tutorial.

## Windows

For **Windows** it will be necessary to download and install the compiler.

### Download MSYS2

The first step to install the C++ compiler on Windows is to download and install **MSYS2**. MSYS2 is a Unix environment emulation system that allows you to use Linux development tools on Windows.

To download MSYS2, go to the official web site at https://www.msys2.org/ and click on the **"Download MSYS2"** button on the home page. Download the appropriate version for your operating system (32-bit or 64-bit) and follow the installation instructions.

### Upgrade MSYS2

Once MSYS2 is installed, open the MSYS2 MSYS program, which displays a **terminal**. In the terminal, run the following command to update MSYS2:

```bash
pacman -Syu
```

This command will update the operating system and all installed packages.

### Install the development tools

After upgrading MSYS2, run the following command to install the development tools needed to compile C++ code:

```bash
pacman -S --needed base-devel mingw-w64-x86_64-toolchain
```

This command will install a set of development tools including the C++ compiler **(GCC)**, the basic development toolset **(base-devel)** and the 64-bit development toolset **(mingw-w64-x86_64-toolchain)**.

### Add the compiler directory to the PATH

Finally, in order for Windows to be able to find the C++ compiler, the compiler directory must be added to the system's **PATH**. The compiler directory is located in **"C:\msys64\mingw64\bin "**.

To add the compiler directory to the PATH, follow these steps:

- Open the start menu and search for "environment variables".
- Select "Edit system environment variables".
- On the "Advanced" tab, click the "Environment Variables" button.
- Find the PATH variable in the list of system environment variables and select it.
- Click the "Edit" button.
- Add the path **"C:msys64mingw64w64bin "** to the end of the PATH variable value.
- Click "OK" to save the changes.

That's it! You now have the C++ compiler installed on your Windows system and are ready to start programming.
