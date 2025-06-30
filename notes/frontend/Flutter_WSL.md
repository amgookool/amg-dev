# Setting up Android Studio & Emulator on WSL 2

This guide covers the complete setup process for running Android Studio and Android emulator on Windows Subsystem for Linux 2 (WSL 2), enabling Flutter development in a Linux environment while leveraging Windows host capabilities.

## Prerequisites

- Windows 10/11 with WSL 2 enabled
- Ubuntu or similar Linux distribution installed on WSL 2
- At least 8GB RAM (16GB recommended)
- 50GB+ available disk space
- BIOS/UEFI virtualization enabled

## Install WSL 2 Ubuntu & Update Packages & Install JDK

1. Open PowerShell as Administrator and run:

   ```bash
   wsl --install -d Ubuntu
   ```

2. After installation, open the Ubuntu terminal and update packages:

   ```bash
   sudo apt update && sudo apt upgrade -y
   ```

3. Install the Java Development Kit (JDK):

   ```bash
   sudo apt install default-jdk -y
   ```

## Install Android Studio & Flutter SDK

1. Create a directory for Android Studio and Flutter SDK:

   ```bash
   mkdir -p ~/Software/
   ```

2. Download the Flutter SDK in the directory via vscode Flutter extension

3. Download Android Studio from the Archives section and download one of the newer versions of Linux Android Studio

   - [Android Studio Download](https://developer.android.com/studio/archive)

4. Extract the downloaded Android Studio tar file:

   ```bash
   tar -xvf android-studio-*.tar.gz
   ```

## Running Android Studio

1. Navigate to the Android Studio bin directory:

   ```bash
   cd ~/Software/android-studio/bin
   ```

2. Start Android Studio:

   ```bash
   ./studio.sh
   ```

3. Follow the setup wizard to complete the installation.

## Graphics Error Fix

If you encounter a graphics error when running Android Studio, you can try the following:

1. Setup Display server to launch GUI apps from WSL2 using VcXsrv

   - Install VcXsrv on Windows: [VcXsrv Download](https://sourceforge.net/projects/vcxsrv/)
   - Create a `config.xlaunch` file with the following content:

     ```xml
      <?xml version="1.0" encoding="UTF-8"?>
      <XLaunch WindowMode="MultiWindow" ClientMode="NoClient" LocalClient="False" Display="0" LocalProgram="xcalc" RemoteProgram="xterm" RemotePassword="" PrivateKey="" RemoteHost="" RemoteUser="" XDMCPHost="" XDMCPBroadcast="False" XDMCPIndirect="False" Clipboard="True" ClipboardPrimary="False" ExtraParams="" Wgl="False" DisableAC="True" XDMCPTerminate="False"/>
     ```

   - Save the file to the Startup Folder in Windows

2. Allow VcXsrv through the Windows Firewall:

   - Open Windows Defender Firewall
   - Click on "Allow an app or feature through Windows Defender Firewall"
   - Add `vcxsrv.exe` to the list and allow it on both private and public networks

3. In WSL Ubuntu, open the /etc/profile file:

   ```bash
   sudo nano /etc/profile
   ```

4. Add the following line at the end of the file:

   ```bash
   export DISPLAY=$(grep nameserver /etc/resolv.conf | awk '{print $2}'):0.0
   export JAVA_HOME=/usr/lib/jvm/java-1.21.0-openjdk-amd64
   export PATH=$JAVA_HOME/bin:$PATH
   ```

## Setup Emulators

1. Add the following lines to /etc/profile

```bash
export ANDROID_SDK_ROOT=/home/adrian/Android/Sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export WSL_HOST=$(tail -1 /etc/resolv.conf | cut -d ' ' -f2)
export ADB_SERVER_SOCKET=tcp:$WSL_HOST:5037
```
