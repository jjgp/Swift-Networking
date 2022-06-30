// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Swift-Networking",
    platforms: [
        .macOS(.v12),
    ],
    products: [],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "4.0.0")),
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.6.1")),
    ],
    targets: [
        .executableTarget(
            name: "Run",
            dependencies: [
                .target(name: "App"),
            ]
        ),
        .target(
            name: "App",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
            ],
            swiftSettings: [
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release)),
            ]
        ),
        .target(
            name: "XCTVaporTestCase",
            dependencies: [
                .target(name: "App"),
                .product(name: "XCTVapor", package: "vapor"),
            ]
        ),
        .testTarget(
            name: "AlamofireTests",
            dependencies: [
                .product(name: "Alamofire", package: "Alamofire"),
                .target(name: "XCTVaporTestCase"),
            ]
        ),
        .testTarget(
            name: "URLSessionTests",
            dependencies: [
                .target(name: "XCTVaporTestCase"),
            ]
        ),
    ]
)
