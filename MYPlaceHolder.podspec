#
# Be sure to run `pod lib lint MYPlaceHolder.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MYPlaceHolder'
  s.version          = '0.1.0'
  s.summary          = 'A short description of MYPlaceHolder.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/sunjinshuai/MYPlaceHolder'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sunjinshuai' => 's_mike@163.com' }
  s.source           = { :git => 'https://github.com/sunjinshuai/MYPlaceHolder.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.frameworks = 'UIKit', 'Foundation'
 
 # For Default
 s.default_subspec = 'Core'
 s.static_framework = true
 
 ### Subspecs
 s.subspec 'Core' do |core|
   core.dependency 'MYPlaceHolder/TableView'
   core.dependency 'MYPlaceHolder/CollectionView'
   core.source_files = 'MYPlaceHolder/Classes/MYPlaceHolder.h'
 end
 
 s.subspec 'TableView' do |tableview|
   tableview.source_files = 'MYPlaceHolder/Classes/TableView/**/*'
 end
 
 s.subspec 'CollectionView' do |collectionview|
   collectionview.source_files = 'MYPlaceHolder/Classes/CollectionView/**/*'
 end
 
end
