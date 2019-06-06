// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TextEditor",
    products: [
        .library(
            name: "TextEditor",
            targets: ["TextEditor"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "TextEditor",
            dependencies: []),
    ]
)
