// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ADS",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "ADS",
            targets: ["ADS"]),
    ],
    dependencies: [
        .package(url: "https://github.com/tevelee/SwiftUI-Flow.git", exact: "1.1.0"),
        .package(url: "https://github.com/kean/Nuke.git", exact: "12.3.0")
    ],
    targets: [
        .target(
            name: "ADS",
            dependencies: [
                .product(name: "Flow", package: "SwiftUI-Flow"),
                .product(name: "Nuke", package: "Nuke"),
                .product(name: "NukeUI", package: "Nuke")
            ],
            resources: [
                .process("Resource/Font"),
                .process("Resource/Assets.xcassets")
            ]
        )
    ]
)
