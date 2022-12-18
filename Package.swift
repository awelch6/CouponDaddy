// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "CouponDaddy",
    platforms: [
       .macOS(.v12),
       .iOS(.v14)
    ],
    products: [
        .executable(name: "server-app", targets: ["App"]),
        .executable(name: "server-client", targets: ["Client"])
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
        .package(url: "https://github.com/TokamakUI/Tokamak", from: "0.11.0"),
    ],
    targets: [
        .target(name: "Model"),
        .executableTarget(
            name: "App",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .target(name: "Model")
            ]
        ),
        .executableTarget(
            name: "Client",
            dependencies: [
                .product(name: "TokamakShim", package: "Tokamak"),
                .target(name: "Model")
            ]
        ),
    ]
)
