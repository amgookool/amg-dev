# Flutter Mobile Development

This documentation consists of the following topics:

- [Flutter Mobile Development](#flutter-mobile-development)
  - [WSL Installation](#wsl-installation)
  - [Flutter Widgets](#flutter-widgets)

## WSL Installation

1. Create a `Applications` directory in the `~` directory.

2. Download the Flutter SDK from the official website or use vscode to download the SDK.
   
   1. Using vsCode:
      1. Install the Flutter extension.
      
      2. Open the command palette and search for `Flutter: Run Flutter Doctor`.
      
      3. This will prompt you to download the SDK. Install it in the `Applications` directory.
      
      4. Add the following to the `.bashrc` file:
         ```bash
         export PATH="$PATH:$HOME/Applications/flutter/bin"
         ```

3. Download Android Studio from the official website in the temporary directory.

4. Extract the downloaded tar.gz file in the `Applications` directory.
   1. Use command:
     `tar -xvzf <filename>.tar.gz -C ~/Applications`

6. Add the following to the .bashrc or .zshrc file:
   ```bash
   export ANDROID_HOME="$HOME/Android/Sdk"
   export PATH="$PATH:$ANDROID_HOME/emulator"
   export PATH="$PATH:$ANDROID_HOME/platform-tools"
   export PATH="$PATH:$ANDROID_HOME/build-tools"
   alias android-studio="$HOME/Applications/android-studio/bin/studio.sh"
   ``` 

7. Install the required binaries given by [this link](https://developer.android.com/studio/install#64bit-libs)
   1. If it fails...don't worry, it's not necessary.

8. Check wether KVM is installed
   1. Use the command to install cpi-checker package:
      `sudo apt-get install cpu-checker`
   2. Run command:
      1. `egrep -c '(vmx|svm)' /proc/cpuinfo`
      2. An output of 1 or greater means that virtualization is supported.
   3. Run the command:
      1. `kvm-ok`
      2. Expected output: `INFO: Your CPU does not support KVM extensions KVM acceleration can NOT be used`
   4. Run the following commands to install KVM:
      1. `sudo apt-get install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils`
   5. If you get a permission error when launching the emulator, follow [this guide](https://www.codeproject.com/Articles/5266468/Fix-dev-kvm-is-Not-Found-and-Device-Permission-Den#:~:text=Solving%20%2Fdev%2Fkvm%20device%20permission%20denied%20Error&text=you%20need%20to%20install%20qemu,username%20to%20the%20kvm%20group.&text=If%20your%20user%20name%20is,start%20using%20your%20Android%20emulator.)

## Flutter Widgets