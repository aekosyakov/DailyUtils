// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DailyUtils",
    products: [
        .library(
            name: "DailyUtils",
            targets: ["DailyUtils"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DailyUtils",
            dependencies: []),
        .testTarget(
            name: "DailyUtilsTests",
            dependencies: ["DailyUtils"]),
    ]
)
