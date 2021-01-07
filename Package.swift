// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "swift-combinatorics",
    products: [
        .library(name: "Combinatorics", targets: ["Combinatorics"]),
    ],
    targets: [
        .target(
            name: "Combinatorics",
            dependencies: []
        ),
        .testTarget(
            name: "CombinatoricsTests",
            dependencies: ["Combinatorics"]
        ),
    ]
)
