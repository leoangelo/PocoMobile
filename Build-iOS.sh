#!/bin/bash

# Author: François-Xavier Thomas <fx.thomas@gmail.com>
# Author: Be Sport 2012

# Update Poco
git submodule update

# Build Poco
cd Source/

OMITTED_LIBS=CppParser,CodeGeneration,Remoting/RemoteGen,Crypto,NetSSL_OpenSSL,NetSSL_Win,Net,Data/ODBC,Data/MySQL,MongoDB,PageCompiler,PDF,SevenZip,XML,ApacheConnector,Zip

# Build iPhone libraries
./configure --config=iPhone-clang-libc++ --no-tests --no-samples --omit=--omit=$OMITTED_LIBS
make IPHONE_SDK_VERSION_MIN=5.0 POCO_TARGET_OSARCH=armv7 -s -j2
make IPHONE_SDK_VERSION_MIN=5.0 POCO_TARGET_OSARCH=armv7s -s -j2
make IPHONE_SDK_VERSION_MIN=5.0 POCO_TARGET_OSARCH=arm64 -s -j2

# Build iPhone simulator libraries
./configure --config=iPhoneSimulator-clang-libc++ --no-tests --no-samples --omit=--omit=$OMITTED_LIBS
make -s -j2
