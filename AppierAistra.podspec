require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'version_aistra_sdk.json')))

Pod::Spec.new do |s|
  s.name         = "AppierAistra"
  # The vendored framework's module is `Aistra` regardless of the pod name, so
  # consumers always `import Aistra`.
  s.module_name  = "Aistra"
  s.version      = package['version'][1..-1]
  s.summary      = "Appier Aistra device-signal SDK."
  s.homepage     = "https://www.appier.com"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Appier" => "appier-ssp-dev@appier.com" }
  s.platform     = :ios, '12.0'
  # Plain semver tag (e.g. 2.0.0) — the same tag SPM resolves against, so all
  # three integration paths (SPM / CocoaPods / direct download) share one tag.
  s.source       = { :git => "https://github.com/appier/ads-aistra-ios.git", :tag => package['version'][1..-1] }
  s.ios.vendored_frameworks = 'Aistra.xcframework'
  s.frameworks   = 'Foundation', 'UIKit', 'AVFoundation', 'CoreTelephony', 'Network', 'AdSupport', 'AppTrackingTransparency', 'StoreKit'
  s.requires_arc = true
  s.readme = 'https://github.com/appier/ads-aistra-ios/blob/main/README.md'
end
