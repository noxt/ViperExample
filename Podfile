platform :ios, '10.0'
use_frameworks!
inhibit_all_warnings!


target 'ViperExample' do

  # Networking
  pod 'Alamofire', '~> 4.0'
  pod 'AlamofireNetworkActivityIndicator', '~> 2.0'
  pod 'ObjectMapper', '~> 2.2'

  # UI Helpers
  pod 'TableKit', :git => 'https://github.com/noxt/TableKit'
  
  # Database
  pod 'Realm'
  pod 'RealmSwift'
  
end


post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end

