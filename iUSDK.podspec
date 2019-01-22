#
# Be sure to run `pod lib lint iUSDK-iOS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'iUSDK'
    s.version          = '0.1.3'
    s.summary          = 'An iOS Lib for retrieving iPhone Contacts'
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    
    s.description      = <<-DESC
    This library is used to simplify the process of retrieving contacts from iPhone agenda.
    DESC
    
    s.homepage         = 'https://github.com/victorlsn/iUSDK-iOS.git'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'victorlsn@gmail.com' => 'victor@iuapp.com.br' }
    s.source           = { :git => 'https://github.com/victorlsn/iUSDK-iOS.git', :tag => s.version.to_s }
    # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
    
    s.ios.deployment_target = '8.0'
    
    s.source_files = 'iUSDK/Classes/*.swift'
    
    # s.resource_bundles = {
    #   'iUSDK-iOS' => ['iUSDK-iOS/Assets/*.png']
    # }
    
    # s.public_header_files = 'Pod/Classes/**/*.h'
    s.frameworks = 'Foundation', 'Contacts'
    # s.dependency 'AFNetworking', '~> 2.3'
end
