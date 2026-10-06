# Aistra iOS SDK

Binary distribution of **Aistra**, Appier's device-signal SDK. The public module
is `Aistra` (`import Aistra`), shipped as a signed `Aistra.xcframework`.

This repo is generated from the private source repo
`appier-ads-data-signal-ios`; only the built framework, podspec, and SPM
manifest live here. Do not edit sources here — releases are opened as PRs by the
source repo's CI.

## Requirements

- iOS 12.0+
- Swift Package Manager (swift-tools 5.7.1 / Xcode 14.1+), CocoaPods, or a
  manually embedded xcframework
- `Aistra.xcframework` is a dynamic framework that links these system
  frameworks: Foundation, UIKit, AVFoundation, CoreTelephony, Network,
  AdSupport, AppTrackingTransparency, StoreKit and WebKit. SPM and CocoaPods add
  them to your link line automatically.
- The framework ships its own privacy manifest (`PrivacyInfo.xcprivacy`).

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

// Start as early as possible (e.g. at app launch) so asynchronous signals such
// as the WebKit user agent can resolve before the first ad request.
AistraSDK.start()

// Optional: supply coordinates from a source you already authorize. Until this
// is set (or while it returns nil) the geo fields are omitted — the SDK never
// touches CoreLocation itself.
AistraSDK.locationProvider = myLocationProvider   // conforms to LocationProviding

// Encrypted snapshot of the device signals. Optional asynchronous fields,
// including the user agent, are omitted until they have resolved.
let aistraData: Data = AistraSDK.getData()

// Record ad lifecycle events so they are reflected in later snapshots.
AistraSDK.recordAdEvent(.impression, bidObjId: bidObjId,
                        meta: AdEventMeta(adomain: "example.com", bundle: "com.example.app"))
AistraSDK.recordStoreViewDisplayed()   // after showing a StoreKit product page
```

A location source only has to expose a coordinate pair:

```swift
final class MyLocationProvider: LocationProviding {
    var coordinate: (latitude: Double, longitude: Double)? {
        // Return nil while no authorized fix is available.
        return (latitude: 25.0330, longitude: 121.5654)
    }
}
```

### Public API

All members are static on `AistraSDK`.

| Member | Purpose |
| ------ | ------- |
| `start()` | Boot the shared instance early so lifecycle tracking and asynchronous signal collection start at launch |
| `version: String` | The compiled-in Aistra version, readable without starting collection |
| `getData() -> Data` | Current signal snapshot, encrypted for the Aistra request field |
| `locationProvider: LocationProviding?` | Inject a coordinate source at any time |
| `recordAdEvent(_:bidObjId:meta:)` | Record an ad `.win`, `.impression` or `.click`, with optional `AdEventMeta` (`adomain`, `bundle`) |
| `recordStoreViewDisplayed()` | Mark that a StoreKit product page was shown |

`getData()` is safe to call from any thread — UIKit-backed reads are marshalled
onto the main thread internally. It is also exposed to Objective-C as
`[AistraSDK getData]`; the rest of the API is Swift-only.

## License

Aistra is available under the MIT license. See the [LICENSE](LICENSE) file.

## Author

Appier Inc., appier-ssp-dev@appier.com — https://www.appier.com
