#!/bin/sh
FMK_NAME=${PROJECT_NAME}

# Install dir will be the final output to the framework.

# The following line create it in the root folder of the current project.

INSTALL_DIR=${SRCROOT}/../products/${FMK_NAME}.framework

# Working dir will be deleted after the framework creation.

WRK_DIR=build

DEVICE_DIR=${WRK_DIR}/Release-iphoneos/${FMK_NAME}.framework

SIMULATOR_DIR=${WRK_DIR}/Release-iphonesimulator/${FMK_NAME}.framework

TEMP_DIR=${WRK_DIR}/TEMP/${FMK_NAME}.framework

# -configuration ${CONFIGURATION}

# Clean and Building both architectures.

xcodebuild -configuration "Release" -target "${FMK_NAME}" -sdk iphoneos clean build

xcodebuild -configuration "Release" -target "${FMK_NAME}" -sdk iphonesimulator clean build

# Cleaning the oldest.

if [ -d "${INSTALL_DIR}" ]

then

rm -rf "${INSTALL_DIR}"

fi

mkdir -p "${INSTALL_DIR}"

cp -R "${DEVICE_DIR}/" "${INSTALL_DIR}/"

# Uses the Lipo Tool to merge both binary files (i386 + armv6/armv7) into one Universal final product.


lipo -create "${DEVICE_DIR}/${FMK_NAME}" "${SIMULATOR_DIR}/${FMK_NAME}" -output "${INSTALL_DIR}/${FMK_NAME}"

rm -r "${WRK_DIR}"

#open "${INSTALL_DIR}"

#Resource bundle
BUNDLE_TARGET_NAME=${FMK_NAME}Resource
BUNDLEDEVICE_DIR=${WRK_DIR}/Release-iphoneos/${FMK_NAME}.bundle
INSTALL_BUNDLE_DIR=${SRCROOT}/../products/${FMK_NAME}.bundle

#build resource
xcodebuild -configuration "Release" -target "${BUNDLE_TARGET_NAME}" -sdk iphoneos clean build

ditto "${BUNDLEDEVICE_DIR}" "${INSTALL_BUNDLE_DIR}"

rm -f "${INSTALL_BUNDLE_DIR}"/info.plist
rm -f "${INSTALL_BUNDLE_DIR}/${FMK_NAME}"
