# Aistra iOS SDK

Binary distribution of **Aistra**, Appier's device-signal SDK. The public module
is `Aistra` (`import Aistra`), shipped as a signed `Aistra.xcframework`.

This repo is generated from the private source repo
`appier-ads-data-signal-ios`; only the built framework, podspec, and SPM
manifest live here. Do not edit sources here — releases are opened as PRs by the
source repo's CI.

> **Migrating from Argus (1.x)?** Aistra 2.0.0 replaces the Argus SDK. The
> CocoaPods pod is now `AppierAistra` (was `AppierArgus`), the module is
> `Aistra` (was `Argus`), and the entry point is `AistraSDK` (was `ArgusSDK`).
> This repo was renamed from `ads-argus-ios`; the old URL redirects here.

## Installation

Aistra supports three integration paths.

### Swift Package Manager

In Xcode: **File ▸ Add Package Dependencies…** and enter

```
https://github.com/appier/ads-aistra-ios.git
```

or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/appier/ads-aistra-ios.git", from: "2.0.0")
],
targets: [
    .target(
        name: "YourApp",
        dependencies: [
            .product(name: "Aistra", package: "ads-aistra-ios")
        ]
    )
]
```

### CocoaPods

Add to your `Podfile`:

```ruby
pod 'AppierAistra'
```

then `pod install`. (The module is `Aistra` regardless of the pod name.)

### Direct download (manual)

Download `AistraFramework.zip` from the
[latest release](https://github.com/appier/ads-aistra-ios/releases), unzip it,
and drag `Aistra.xcframework` into your target's **Frameworks, Libraries, and
Embedded Content** with **Embed & Sign**.

## Usage

```swift
import Aistra

// Start as early as possible (e.g. at app launch) so asynchronous signals can
// resolve before the first ad request.
AistraSDK.start()

let aistraData: Data = AistraSDK.getData()
```

See the SDK documentation for the full public API.

## License

Aistra is available under the MIT license. See the [LICENSE](LICENSE) file.

## Author

Appier Inc., appier-ssp-dev@appier.com — https://www.appier.com
