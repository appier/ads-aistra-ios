// Intentionally empty.
//
// SPM binaryTargets cannot be a library product's sole content, so this shim
// target wraps `Aistra.xcframework` and carries its system-framework link
// settings (see Package.swift). Consumers `import Aistra` — the module vended by
// the binary — never this wrapper.
