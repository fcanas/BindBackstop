// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BindBackstop",
    platforms: [.macOS(.v10_15),
                .iOS(.v13),
                .tvOS(.v13),
                .watchOS(.v6)],
    products: [
        .library(
            name: "BindBackstop",
            targets: ["BindBackstop"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "BindBackstop",
            dependencies: []),
        .testTarget(
            name: "BindBackstopTests",
            dependencies: ["BindBackstop"]),
    ]
)
