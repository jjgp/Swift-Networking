// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Swift-Networking",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "4.0.0")),
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.6.1")),
    ],
    targets: [
        .testTarget(
            name: "AlamofireTests",
            dependencies: [
                .product(name: "Alamofire", package: "Alamofire"),
            ]
        ),
        .testTarget(
            name: "URLSessionTests",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
            ]
        ),
    ]
)
