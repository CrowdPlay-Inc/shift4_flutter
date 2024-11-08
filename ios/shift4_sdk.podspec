#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint shift4_sdk.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'shift4_sdk'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter plugin project.'
  s.description      = <<-DESC
A new Flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Sources/**/*'
  s.dependency 'Flutter'
  s.dependency 'BraintreeDropIn', '~> 9.13.0'
  s.dependency 'SwiftJWT', '~> 4.0.1'
  s.platform = :ios, '15.6'
  s.ios.vendored_frameworks = 'Frameworks/VNWebSDK.xcframework'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.9'
end
