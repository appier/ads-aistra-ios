// swift-tools-version:5.7.1
import PackageDescription

// SPM distribution of the Aistra device-signal SDK.
//
// The precompiled binary ships as `Aistra.xcframework` (a binaryTarget). The
// public module is `Aistra` (`import Aistra`) and comes from that binary. The
// `AistraWrapper` target is an (empty) shim that depends on the binary and
// declares the system frameworks Aistra needs, so integrators get the correct
// link line automatically. Consume it as the `Aistra` library product.
let package = Package(
    name: "Aistra",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "Aistra",
            targets: ["AistraWrapper"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "Aistra",
            path: "Aistra.xcframework"
        ),
        .target(
            name: "AistraWrapper",
            dependencies: [
                .target(name: "Aistra")
            ],
            path: "Sources/AistraWrapper",
            linkerSettings: [
                .linkedFramework("Foundation"),
                .linkedFramework("UIKit"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("Network"),
                .linkedFramework("AdSupport"),
                .linkedFramework("AppTrackingTransparency"),
                .linkedFramework("StoreKit"),
                .linkedFramework("WebKit")
            ]
        )
    ]
)
