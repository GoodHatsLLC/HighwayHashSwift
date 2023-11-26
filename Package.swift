// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

#if arch(x86_64)
let EXCLUDE = "arm64/"
let CXXSETTINGS: [CXXSetting] = []
#elseif arch(arm64)
let EXCLUDE = "x86_64/"
let CXXSETTINGS: [CXXSetting] = []
#endif

let package = Package(
  name: "HighwayHash",
  platforms: [
    .iOS(SupportedPlatform.IOSVersion.v15),
    .macOS(SupportedPlatform.MacOSVersion.v12),
  ],
  products: [
    .library(
      name: "HighwayHash",
      type: .static,
      targets: ["HighwayHash"]
    ),
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "HighwayHash",
      dependencies: ["Bridge"]
    ),
    .target(
      name: "Bridge",
      dependencies: ["libhighwayhash"]
    ),
    .target(
      name: "libhighwayhash",
      exclude: [
        EXCLUDE,
        "compiler_specific.h",
        "endianess.h",
        "hh_buffer.h",
        "highwayhash_target.cpp",
        "iaca.h",
        "load3.h",
        "state_helpers.h",
        "vector_neon.h",
      ],
      cxxSettings: CXXSETTINGS
    ),
    .testTarget(
      name: "HighwayHashTests",
      dependencies: ["HighwayHash", "Bridge", "libhighwayhash"]
    ),
  ],
  cLanguageStandard: CLanguageStandard.c11,
  cxxLanguageStandard: CXXLanguageStandard.cxx11
)
