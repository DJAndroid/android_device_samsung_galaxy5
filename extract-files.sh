#!/bin/sh

# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Extract prebuilt libraries (from a CM7 running device) needed for the galaxy5

MANUFACTURER=samsung
DEVICE=galaxy5

DIRS="
bin
etc/firmware
lib/egl
lib/hw
wifi/ath6k/AR6003/hw2.0/
usr/keychars
usr/keylayout
"

for DIR in $DIRS; do
	mkdir -p ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/$DIR
done

FILES="
bin/BCM2049B0_BCM20780B0_002.001.022.0170.0174.hcd
bin/hostapd_cli
bin/hostapd_wps
bin/hostapd
bin/memsicd
bin/qmuxd
bin/rild
bin/wlan_tool
bin/wmiconfig

etc/firmware/yamato_pfp.fw
etc/firmware/yamato_pm4.fw

lib/egl/libEGL_adreno200.so
lib/egl/libGLESv1_CM_adreno200.so
lib/egl/libGLESv2_adreno200.so
lib/egl/libq3dtools_adreno200.so

lib/hw/sensors.default.so

lib/liba2dp.so
lib/libaudioeq.so
lib/libdiag.so
lib/libgsl.so
lib/libmm-adspsvc.so
lib/libmmipl.so
lib/libmmjpeg.so
lib/liboemcamera.so
lib/libomx_aacdec_sharedlibrary.so
lib/libomx_amrdec_sharedlibrary.so
lib/libomx_amrenc_sharedlibrary.so
lib/libomx_avcdec_sharedlibrary.so
lib/libomx_m4vdec_sharedlibrary.so
lib/libomx_mp3dec_sharedlibrary.so
lib/libomx_sharedlibrary.so
lib/libOmxAacDec.so
lib/libOmxAacEnc.so
lib/libOmxAdpcmDec.so
lib/libOmxAmrDec.so
lib/libOmxAmrEnc.so
lib/libOmxAmrRtpDec.so
lib/libOmxAmrwbDec.so
lib/libOmxEvrcDec.so
lib/libOmxEvrcEnc.so
lib/libOmxH264Dec.so
lib/libOmxMp3Dec.so
lib/libOmxMpeg4Dec.so
lib/libOmxQcelp13Enc.so
lib/libOmxQcelpDec.so
lib/libOmxWmaDec.so
lib/libOmxWmvDec.so
lib/libOmxVidEnc.so
lib/libril.so
lib/libsec-ril.so
lib/libsecril-client.so

usr/keychars/europa_keypad0.kcm.bin
usr/keylayout/europa_headset.kl
usr/keylayout/europa_keypad0.kl

wifi/ath6k/AR6003/hw2.0/athtcmd_ram.bin
wifi/ath6k/AR6003/hw2.0/athwlan.bin.z77
wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin
wifi/ath6k/AR6003/hw2.0/data.patch.bin
wifi/ath6k/AR6003/hw2.0/otp.bin.z77
"

for FILE in $FILES; do
    adb pull system/$FILE ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/$FILE
done

chmod 755 ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/bin/*

(cat << EOF) | sed -e s/__DEVICE__/$DEVICE/g -e s/__MANUFACTURER__/$MANUFACTURER/g > ../../../vendor/$MANUFACTURER/$DEVICE/$DEVICE-vendor-blobs.mk
# Copyright (C) 2010 The AndroidOpen Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is generated by device/__MANUFACTURER__/__DEVICE__/extract-files.sh - DO NOT EDIT

# All the blobs necessary for galaxy5
PRODUCT_COPY_FILES += \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/BCM2049B0_BCM20780B0_002.001.022.0170.0174.hcd:system/bin/BCM2049B0_BCM20780B0_002.001.022.0170.0174.hcd \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/hostapd_cli:system/bin/hostapd_cli \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/hostapd_wps:system/bin/hostapd_wps \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/hostapd:system/bin/hostapd \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/memsicd:system/bin/memsicd \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/qmuxd:system/bin/qmuxd \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/rild:system/bin/rild \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/wlan_tool:system/bin/wlan_tool \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bin/wmiconfig:system/bin/wmiconfig

PRODUCT_COPY_FILES += \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw

PRODUCT_COPY_FILES += \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so

PRODUCT_COPY_FILES += \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/hw/sensors.default.so:system/lib/hw/sensors.default.so

PRODUCT_COPY_FILES += \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/liba2dp.so:system/lib/liba2dp.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libaudioeq.so:system/lib/libaudioeq.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libdiag.so:system/lib/libdiag.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libgsl.so:system/lib/libgsl.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libmmipl.so:system/lib/libmmipl.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libmmjpeg.so:system/lib/libmmjpeg.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/liboemcamera.so:system/lib/liboemcamera.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libomx_aacdec_sharedlibrary.so:system/lib/libomx_aacdec_sharedlibrary.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libomx_amrdec_sharedlibrary.so:system/lib/libomx_amrdec_sharedlibrary.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libomx_amrenc_sharedlibrary.so:system/lib/libomx_amrenc_sharedlibrary.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libomx_avcdec_sharedlibrary.so:system/lib/libomx_avcdec_sharedlibrary.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libomx_m4vdec_sharedlibrary.so:system/lib/libomx_m4vdec_sharedlibrary.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libomx_mp3dec_sharedlibrary.so:system/lib/libomx_mp3dec_sharedlibrary.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libomx_sharedlibrary.so:system/lib/libomx_sharedlibrary.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOmxAdpcmDec.so:system/lib/libOmxAdpcmDec.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOmxQcelpDec.so:system/lib/libOmxQcelpDec.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOmxWmvDec.so:system/lib/libOmxWmvDec.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libril.so:system/lib/libril.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libsec-ril.so:system/lib/libsec-ril.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/lib/libsecril-client.so:system/lib/libsecril-client.so

PRODUCT_COPY_FILES += \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/usr/keychars/europa_keypad0.kcm.bin:system/usr/keychars/europa_keypad0.kcm.bin \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/usr/keylayout/europa_headset.kl:system/usr/keylayout/europa_headset.kl \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/usr/keylayout/europa_keypad0.kl:system/usr/keylayout/europa_keypad0.kl

PRODUCT_COPY_FILES += \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/wifi/ath6k/AR6003/hw2.0/athtcmd_ram.bin:system/wifi/ath6k/AR6003/hw2.0/athtcmd_ram.bin \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/wifi/ath6k/AR6003/hw2.0/athwlan.bin.z77:system/wifi/ath6k/AR6003/hw2.0/athwlan.bin.z77 \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/wifi/ath6k/AR6003/hw2.0/data.patch.bin:system/wifi/ath6k/AR6003/hw2.0/data.patch.bin \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/wifi/ath6k/AR6003/hw2.0/otp.bin.z77:system/wifi/ath6k/AR6003/hw2.0/otp.bin.z77

EOF

./setup-makefiles.sh
