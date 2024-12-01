#!/bin/bash

# Habilite otimizações do compilador Intel
scripts/config --set-val CONFIG_CC_IS_ICC n
scripts/config --set-val CONFIG_CC_IS_CLANG y
scripts/config --set-val CONFIG_CC_IS_GCC n

#
scripts/config --set-val CONFIG_HAS_LTO_CLANG y
scripts/config --set-val CONFIG_LTO_CLANG 3
#1: none; 2: full; 3: thin

# Configure for LLVM tools
scripts/config --set-str SYSTEM_TRUSTED_KEYS ""
scripts/config --set-str SYSTEM_REVOCATION_KEYS ""
scripts/config --set-val CONFIG_LD_IS_LLD y
scripts/config --set-val CONFIG_LD_IS_BFD n

#
scripts/config --set-val CONFIG_GENERIC_CPU n
scripts/config --set-val CONFIG_MNATIVE_INTEL y

#
scripts/config --set-val CONFIG_DEBUG_INFO 1
scripts/config --set-val CONFIG_DEBUG_INFO_NONE y
scripts/config --set-val CONFIG_DEBUG_KERNEL n
scripts/config --set-val CONFIG_DEBUG_FS n
scripts/config --set-val CONFIG_DEBUG_INFO_BTF n
scripts/config --set-val CONFIG_DEBUG_PREEMPT n
scripts/config --set-val CONFIG_LOCKDEP n
scripts/config --set-val CONFIG_PROVE_LOCKING n
scripts/config --set-val CONFIG_KASAN n

# Enable kernel LZ4 compression
scripts/config --set-val CONFIG_KERNEL_LZ4 y

# Disable other compression methods
scripts/config --set-val CONFIG_KERNEL_GZIP n
scripts/config --set-val CONFIG_KERNEL_GZIP n
scripts/config --set-val CONFIG_KERNEL_BZIP2 n
scripts/config --set-val CONFIG_KERNEL_LZMA n
scripts/config --set-val CONFIG_KERNEL_XZ n
scripts/config --set-val CONFIG_KERNEL_LZO n
scripts/config --set-val CONFIG_KERNEL_ZSTD n

# Ativa a compressão LZ4 nos módulos do kernel para carregamento mais rápido
scripts/config --set-val CONFIG_MODULE_COMPRESS y
scripts/config --set-val CONFIG_MODULE_COMPRESS_LZ4 y

# Enable 32-bit Library Support
scripts/config --set-val CONFIG_IA32_EMULATION y
scripts/config --set-val CONFIG_COMPAT y
scripts/config --set-val CONFIG_COMPAT_32BIT_TIME y

# Ativa baixa latência para sistemas interativos
scripts/config --set-val CONFIG_HZ_1000 y
scripts/config --set-val CONFIG_PREEMPT_DYNAMIC y

#Suporte de CPU
scripts/config --set-val CONFIG_CPU_SUP_INTEL y
scripts/config --set-val CONFIG_CPU_SUP_AMD n
scripts/config --set-val CONFIG_CPU_SUP_HYGON n
scripts/config --set-val CONFIG_CPU_SUP_CENTAUR n
scripts/config --set-val CONFIG_CPU_SUP_ZHAOXIN n

#
scripts/config --set-val CONFIG_INTEL_PMC_CORE y # For Intel PMU support
scripts/config --set-val CONFIG_PROCESSOR_SELECT y # Required for specific processor features
