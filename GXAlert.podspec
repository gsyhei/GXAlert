#
#  Be sure to run `pod spec lint GXAlert.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "GXAlert"
  s.version      = "1.0.0"
  s.summary      = "基于UIView的menu分类，领导再也不会说我写个菜单效果慢了！菜单太多也不用再打项目经理了！"
  s.homepage     = "https://github.com/gsyhei/GXAlert"
  s.license      = "MIT"
  s.author       = { "Gin" => "279694479@qq.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/gsyhei/GXAlert.git", :tag => "1.0.0" }
  s.requires_arc = true
  s.source_files = "GXAlert/GXAlert*.{h,m}"
  s.frameworks   = "Foundation","UIKit"

end
