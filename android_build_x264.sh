#!/bin/sh

#############################################################
#
# 注：
#    此处默认使用 $ANDROID_NDK/platforms/android-21 版本，此
#    版本只支持32位toolchain。
#    如果项目中有使用到 ndk-build 工具，请在 Application.mk 中
#    添加 APP_PLATFORM := android-21
#
#############################################################

export NDK=/home/kuwo/devtools/android-ndk-r13

### armeabi-v7a ###
SYSROOT=$NDK/platforms/android-9/arch-arm/
CROSS_PREFIX=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/arm-linux-androideabi-
EXTRA_CFLAGS="-march=armv7-a -mfloat-abi=softfp -mfpu=neon -mthumb -D__ANDROID__ -D__ARM_ARCH_7__ -D__ARM_ARCH_7A__ -D__ARM_ARCH_7R__ -D__ARM_ARCH_7M__ -D__ARM_ARCH_7S__"
EXTRA_LDFLAGS="-nostdlib"
PREFIX=`pwd`/../x264libs/armeabi-v7a

./configure --prefix=$PREFIX \
        --host=arm-linux-androideabi \
        --sysroot=$SYSROOT \
        --cross-prefix=$CROSS_PREFIX \
        --extra-cflags="$EXTRA_CFLAGS" \
        --extra-ldflags="$EXTRA_LDFLAGS" \
        --enable-pic \
        --enable-static \
        --disable-shared \
        --enable-strip \
        --disable-cli \
        --disable-win32thread \
        --disable-avs \
        --disable-swscale \
        --disable-lavf \
        --disable-ffms \
        --disable-gpac \
        --disable-lsmash

make clean
make -j4
make install
make distclean

### armeabi ###
SYSROOT=$NDK/platforms/android-9/arch-arm/
CROSS_PREFIX=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/arm-linux-androideabi-
EXTRA_CFLAGS="-march=armv5te -msoft-float -D__ANDROID__ -D__ARM_ARCH_5TE__ -D__ARM_ARCH_5TEJ__"
EXTRA_LDFLAGS="-nostdlib"
PREFIX=`pwd`/../x264libs/armeabi

./configure --prefix=$PREFIX \
        --host=arm-linux-androideabi \
        --sysroot=$SYSROOT \
        --cross-prefix=$CROSS_PREFIX \
        --extra-cflags="$EXTRA_CFLAGS" \
        --extra-ldflags="$EXTRA_LDFLAGS" \
        --enable-pic \
        --enable-static \
        --disable-shared \
        --enable-strip \
        --disable-cli \
        --disable-win32thread \
        --disable-avs \
        --disable-swscale \
        --disable-lavf \
        --disable-ffms \
        --disable-gpac \
        --disable-lsmash \
        --disable-asm

make clean
make -j4
make install
make distclean

## arm64-v8a ###
SYSROOT=$NDK/platforms/android-24/arch-arm64/
CROSS_PREFIX=$NDK/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-
EXTRA_CFLAGS="-march=armv8-a -D__ANDROID__ -D__ARM_ARCH_8__ -D__ARM_ARCH_8A__"
EXTRA_LDFLAGS="-nostdlib"
PREFIX=`pwd`/../x264libs/arm64-v8a

./configure --prefix=$PREFIX \
       --host=aarch64-linux-android \
       --sysroot=$SYSROOT \
       --cross-prefix=$CROSS_PREFIX \
       --extra-cflags="$EXTRA_CFLAGS" \
       --extra-ldflags="$EXTRA_LDFLAGS" \
       --enable-pic \
       --enable-static \
       --disable-shared \
       --enable-strip \
       --disable-cli \
       --disable-win32thread \
       --disable-avs \
       --disable-swscale \
       --disable-lavf \
       --disable-ffms \
       --disable-gpac \
       --disable-lsmash

make clean
make -j4
make install
make distclean

### x86 ###
SYSROOT=$NDK/platforms/android-24/arch-x86/
CROSS_PREFIX=$NDK/toolchains/x86-4.9/prebuilt/linux-x86_64/bin/i686-linux-android-
EXTRA_CFLAGS="-march=i686 -mtune=i686 -m32 -mmmx -msse2 -msse3 -mssse3 -D__ANDROID__ -D__i686__"
EXTRA_LDFLAGS="-nostdlib"
PREFIX=`pwd`/../x264libs/x86

./configure --prefix=$PREFIX \
        --host=i686-linux-android \
        --sysroot=$SYSROOT \
        --cross-prefix=$CROSS_PREFIX \
        --extra-cflags="$EXTRA_CFLAGS" \
        --extra-ldflags="$EXTRA_LDFLAGS" \
        --enable-pic \
        --enable-static \
        --disable-shared \
        --enable-strip \
        --disable-cli \
        --disable-win32thread \
        --disable-avs \
        --disable-swscale \
        --disable-lavf \
        --disable-ffms \
        --disable-gpac \
        --disable-lsmash \
        --disable-asm

make clean
make -j4
make install
make distclean

### x86_64 ###
SYSROOT=$NDK/platforms/android-24/arch-x86_64/
CROSS_PREFIX=$NDK/toolchains/x86_64-4.9/prebuilt/linux-x86_64/bin/x86_64-linux-android-
EXTRA_CFLAGS="-march=core-avx-i -mtune=core-avx-i -m64 -mmmx -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mpopcnt -D__ANDROID__ -D__x86_64__"
EXTRA_LDFLAGS="-nostdlib"
PREFIX=`pwd`/../x264libs/x86_64

./configure --prefix=$PREFIX \
       --host=x86_64-linux-android \
       --sysroot=$SYSROOT \
       --cross-prefix=$CROSS_PREFIX \
       --extra-cflags="$EXTRA_CFLAGS" \
       --extra-ldflags="$EXTRA_LDFLAGS" \
       --enable-pic \
       --enable-static \
       --disable-shared \
       --enable-strip \
       --disable-cli \
       --disable-win32thread \
       --disable-avs \
       --disable-swscale \
       --disable-lavf \
       --disable-ffms \
       --disable-gpac \
       --disable-lsmash \
       --disable-asm

make clean
make -j4
make install
make distclean

### mips ###
SYSROOT=$NDK/platforms/android-24/arch-mips/
CROSS_PREFIX=$NDK/toolchains/mipsel-linux-android-4.9/prebuilt/linux-x86_64/bin/mipsel-linux-android-
EXTRA_CFLAGS="-march=mips32 -mfp32 -mhard-float -D__ANDROID__ -D__mips__"
EXTRA_LDFLAGS="-nostdlib"
PREFIX=`pwd`/../x264libs/mips

./configure --prefix=$PREFIX \
        --host=mipsel-linux-android \
        --sysroot=$SYSROOT \
        --cross-prefix=$CROSS_PREFIX \
        --extra-cflags="$EXTRA_CFLAGS" \
        --extra-ldflags="$EXTRA_LDFLAGS" \
        --enable-pic \
        --enable-static \
       --disable-shared \
        --enable-strip \
        --disable-cli \
        --disable-win32thread \
        --disable-avs \
        --disable-swscale \
        --disable-lavf \
        --disable-ffms \
        --disable-gpac \
        --disable-lsmash \
        --disable-asm

make clean
make -j4
make install
make distclean

###mips64 ###
SYSROOT=$NDK/platforms/android-24/arch-mips64/
CROSS_PREFIX=$NDK/toolchains/mips64el-linux-android-4.9/prebuilt/linux-x86_64/bin/mips64el-linux-android-
EXTRA_CFLAGS="-march=mips64r6 -D__ANDROID__ -D__mips__"
EXTRA_LDFLAGS="-nostdlib"
PREFIX=`pwd`/../x264libs/mips64

./configure --prefix=$PREFIX \
       --host=mips64el-linux-android \
      --sysroot=$SYSROOT \
      --cross-prefix=$CROSS_PREFIX \
       --extra-cflags="$EXTRA_CFLAGS" \
       --extra-ldflags="$EXTRA_LDFLAGS" \
       --enable-pic \
       --enable-static \
       --disable-shared \
       --enable-strip \
       --disable-cli \
       --disable-win32thread \
       --disable-avs \
       --disable-swscale \
       --disable-lavf \
       --disable-ffms \
       --disable-gpac \
       --disable-lsmash \
       --disable-asm

make clean
make -j4
make install
make distclean
