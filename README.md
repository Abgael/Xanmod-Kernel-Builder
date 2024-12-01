# Xanmod-Kernel-Builder
A script to build a fully optimized Xanmod kernel using LLVM compiler instead of the traditional GCC.

##Building dependencies
It is recommended using LLVM_installer.sh or Intel_OneAPI_installer.sh since it will install and configure the last version of both GCC and LLVM.
Although it is not listed below, installing Lz4 is also required. Preferable 1.10 version or above to take benefit of multithreading support.

| Program            | Minimal version | Command to check the version         |
|--------------------|-----------------|--------------------------------------|
| GNU C              | 5.1             | `gcc --version`                     |
| Clang/LLVM         | 11.0.0          | `clang --version`                   |
| Rust (optional)    | 1.71.1          | `rustc --version`                   |
| bindgen (optional) | 0.65.1          | `bindgen --version`                 |
| GNU make           | 3.82            | `make --version`                    |
| bash               | 4.2             | `bash --version`                    |
| binutils           | 2.25            | `ld -v`                             |
| flex               | 2.5.35          | `flex --version`                    |
| bison              | 2.0             | `bison --version`                   |
| pahole             | 1.16            | `pahole --version`                  |
| util-linux         | 2.10o           | `fdformat --version`                |
| kmod               | 13              | `depmod -V`                         |
| e2fsprogs          | 1.41.4          | `e2fsck -V`                         |
| jfsutils           | 1.1.3           | `fsck.jfs -V`                       |
| reiserfsprogs      | 3.6.3           | `reiserfsck -V`                     |
| xfsprogs           | 2.6.0           | `xfs_db -V`                         |
| squashfs-tools     | 4.0             | `mksquashfs -version`               |
| btrfs-progs        | 0.18            | `btrfsck`                           |
| pcmciautils        | 004             | `pccardctl -V`                      |
| quota-tools        | 3.09            | `quota -V`                          |
| PPP                | 2.4.0           | `pppd --version`                    |
| nfs-utils          | 1.0.5           | `showmount --version`               |
| procps             | 3.2.0           | `ps --version`                      |
| udev               | 081             | `udevd --version`                   |
| grub               | 0.93            | `grub --version` or `grub-install --version` |
| mcelog             | 0.6             | `mcelog --version`                  |
| iptables           | 1.4.2           | `iptables -V`                       |
| openssl & libcrypto | 1.0.0          | `openssl version`                   |
| bc                 | 1.06.95         | `bc --version`                      |
| Sphinx1            | 1.7             | `sphinx-build --version`            |
| cpio               | any             | `cpio --version`                    |
| GNU tar            | 1.28            | `tar --version`                     |
| gtags (optional)   | 6.6.5           | `gtags --version`                   |

Ref.:https://www.kernel.org/doc/html/v6.6/process/changes.html#current-minimal-requirements

