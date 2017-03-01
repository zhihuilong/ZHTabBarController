Pod::Spec.new do |s|
  s.name             = 'ZHTabBarController'
  s.module_name      = 'ZHTabBarController'
  s.version          = '0.1.1'
  s.summary          = 'An alternative for UITabBarController，which support all kinds of Custom TabBarController.'
  s.homepage         = 'https://github.com/zhihuilong/ZHTabBarController'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhihuilong' => 'zhihui.me@gmail.com' }
  s.source           = { :git => 'https://github.com/zhihuilong/ZHTabBarController.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'ZHTabBarController/Classes/**/*'
  s.frameworks = 'UIKit'
  s.requires_arc = true
  s.pod_target_xcconfig = {'SWIFT_VERSION' => '3.0'}
end
