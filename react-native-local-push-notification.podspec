require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-local-push-notification"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = "https://github.com/ltcaosj/react-native-local-push-notification"
  s.license      = "MIT"
  # s.license    = { :type => "MIT", :file => "FILE_LICENSE" }
  s.authors      = { "Your Name" => "yourname@email.com" }
  s.platforms    = { :ios => "10.0", :tvos => "10.0" }
  s.source       = { :git => "https://github.com/ltcaosj/react-native-local-push-notification.git", :tag => "#{s.version}" }

  s.source_files = "ios/**/*.{h,m,swift}"  

  s.dependency "React"
	
  # s.dependency "..."
end

