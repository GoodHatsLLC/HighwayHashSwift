// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "HighwayHash",
  platforms: [
    .iOS(SupportedPlatform.IOSVersion.v15),
    .macOS(SupportedPlatform.MacOSVersion.v12),
  ],
  products: [
    .library(
      name: "HighwayHash",
      targets: ["HighwayHash"]
    ),
  ],
  dependencies: [
  ],
  targets: [
    .target(name: "HighwayHash", dependencies: ["Bridge"]),
    .testTarget(name: "HighwayHashTests", dependencies: ["HighwayHash"]),
    .target(name: "Bridge", dependencies: ["libhighwayhash"]),
    .binaryTarget(
      name: "libhighwayhash",
      path: "Sources/HighwayHash.xcframework"
    ),
  ]
)
