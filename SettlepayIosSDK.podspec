
Pod::Spec.new do |spec|

  spec.name               = "SettlepayIosSDK"
  spec.version            = "0.0.1"
  spec.version            = "0.0.1"
  spec.summary            = "PayApiIosSDK is a framework which provides 4billio payment services implementation to be used in mobile apps"

  spec.description        = "PayApiIosSDK is a framework which provides 4billio payment services implementation to be used in mobile apps"

  spec.homepage           = "https://fcsunrise.com/"
  spec.license            = { :type => "MIT", :file => "FILE_LICENSE" }
  spec.author             = { "Yelyzaveta" => "kartcevayelyzaveta@gmail.com" }
  spec.platform           = :ios, "13.0"
  spec.swift_version      = "5.0"
  spec.source             = { :git => 'https://github.com/Settlepay/ios-sdk.git', :tag => spec.version.to_s }

  spec.source_files = "settlepay-ios-sdk/**/*.{swift}"
  spec.resource_bundles = {
    'settlepay-ios-sdk' => ['settlepay-ios-sdk/**/*.{storyboard}', 'settlepay-ios-sdk/UI/Xibs/*.{xib}', 'settlepay-ios-sdk/*.xcassets', 'settlepay-ios-sdk/Resources/Fonts/**/*.otf', 'settlepay-ios-sdk/Resources/Fonts/**/*.ttf']
  }
  
  spec.dependency 'Alamofire'
  spec.dependency 'QuickLayout'
  spec.dependency 'Marshal'
  spec.dependency 'Promises'

  
  spec.xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  spec.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }



end
