#
#  Be sure to run `pod spec lint YNGuidePageObjc.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "YNGuidePageObjc"
  spec.version      = "1.0.6"
  spec.summary      = "A simple guide page for iOS"

  spec.description  = "A simple guide page for iOS, you can click or scroll to finish the guide"

  spec.homepage     = "https://github.com/foreverleely/YNGuidePage"
  
  spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  spec.author             = { "liyangly" => "foreverleely@hotmail.com" }
  
  spec.platform     = :ios
  
  spec.source       = { :git => "https://github.com/foreverleely/YNGuidePage.git", :tag => "#{spec.version}" }

  spec.source_files  = "YNGuidePage/*.{h,m}"


end
