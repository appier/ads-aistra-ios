fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios pr_aistra_sdk

Open the Aistra SDK release PR (commits the new `Aistra.xcframework` + version).
Invoked by the source repo's release CI after it builds the signed framework.

### ios release_aistra_sdk

Create the Aistra SDK GitHub release — tags the plain version (e.g. `2.0.0`) and
attaches a zipped `Aistra.xcframework` (`AistraFramework.zip`) for direct download.

### ios pods_aistra_sdk

Push the podspec to CocoaPods trunk.

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.
