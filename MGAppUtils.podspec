#
# Be sure to run `pod lib lint MGUtils.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MGAppUtils'
  s.version          = '0.2.1'
  s.summary          = 'A short description of MGAppUtils.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                  MGAppUtils主要包含了常用宏和方法的工具类，是为了后期项目开发方便，仅供自己使用
                       DESC

  s.homepage         = 'https://github.com/dongzs0907/MGAppUtils'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'DongZhenShan' => '68793512@qq.com' }
  s.platform         = :ios, "15.0"
  s.source           = { :git => 'https://github.com/dongzs0907/MGAppUtils.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '15.0'
  s.swift_versions = '5.0'
  s.source_files = 'MGUtils/Classes/**/*'
  
  s.resource_bundles = {
    'MG_Utils' => ['MGUtils/Assets/*.png']
  }
  s.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }
  
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
   s.dependency 'MBProgressHUD', '~> 1.2.0'
   #s.dependency 'SwiftyStoreKit', :git => 'https://github.com/dongzs0907/SwiftyStoreKit.git'
  
end
# git add .
# git commit -m ""
# git push origin master
# git tag 0.1.5
# git push origin --tag
# pod trunk push MGAppUtils.podspec --allow-warnings
#

