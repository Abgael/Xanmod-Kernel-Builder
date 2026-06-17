# Xanmod-Kernel-Builder
A script to build a fully optimized Xanmod kernel using LLVM compiler instead of the traditional GCC.

## Building dependencies
It is recommended using LLVM_installer.sh since it will install and configure the last version of both GCC and LLVM.
Although it is not listed below, installing Lz4 is also required. Preferable 1.10 version or above to take benefit of multithreading support.

| Program | Minimal version | Command to check the version |
|---|---|---|
| bash | 4.2 | 'bash --version' |
| bc | 1.06.95 | 'bc --version' |
| bindgen (optional) | 0.71.1 | 'bindgen --version' |
| binutils | 2.30 | 'ld -v' |
| bison | 2.0 | 'bison --version' |
| btrfs-progs | 0.18 | 'btrfs --version' |
| Clang/LLVM (optional) | 15.0.0 | 'clang --version' |
| e2fsprogs | 1.41.4 | 'e2fsck -V' |
| flex | 2.5.35 | 'flex --version' |
| gdb | 7.2 | 'gdb --version' |
| GNU awk (optional) | 5.1.0 | 'gawk --version' |
| GNU C | 8.1 | 'gcc --version' |
| GNU make | 4.0 | 'make --version' |
| GNU tar | 1.28 | 'tar --version' |
| GRUB | 0.93 | grub --version \|\| 'grub-install --version' |
| gtags (optional) | 6.6.5 | 'gtags --version' |
| iptables | 1.4.2 | 'iptables -V' |
| jfsutils | 1.1.3 | 'fsck.jfs -V' |
| kmod | 13 | 'kmod -V' |
| mcelog | 0.6 | 'mcelog --version' |
| mkimage (optional) | 2017.01 | 'mkimage --version' |
| nfs-utils | 1.0.5 | 'showmount --version' |
| openssl & libcrypto | 1.0.0 | 'openssl version' |
| pahole | 1.22 | 'pahole --version' |
| pcmciautils | 004 | 'pccardctl -V' |
| PPP | 2.4.0 | 'pppd --version' |
| procps | 3.2.0 | 'ps --version' |
| Python | 3.9.x | 'python3 --version' |
| quota-tools | 3.09 | 'quota -V' |
| Rust (optional) | 1.85.0 | 'rustc --version' |
| Sphinx[1] | 3.4.3 | 'sphinx-build --version' |
| squashfs-tools | 4.0 | 'mksquashfs -version' |
| udev | 081 | 'udevadm --version' |
| util-linux | 2.10o | 'mount --version' |
| xfsprogs | 2.6.0 | 'xfs_db -V' |


Ref.:https://docs.kernel.org/process/changes.html#current-minimal-requirements \
Ref.:https://www.kernel.org/doc/html/latest/process/changes.html#current-minimal-requirements

See also:
Ref.:https://wiki.ubuntu.com/Kernel/BuildYourOwnKernel#Build_Environment \
Ref.:https://wiki.debian.org/BuildADebianKernelPackage#Install_the_Required_Packages
