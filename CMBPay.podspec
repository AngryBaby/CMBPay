Pod::Spec.new do |s|
  s.name             = 'CMBPay'
  s.version          = '0.0.1'
  s.summary          = '基于招行一网通的cocopod'

  s.description      = <<-DESC
                        基于招行一网通的二次开发，用于支付模块
                       DESC

  s.homepage         = 'https://github.com/AngryBaby/CMBPay'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'HamYu' => '1669387345@qq.com' }
  s.source           = { :git => 'https://github.com/AngryBaby/CMBPay.git', :tag => s.version.to_s }
  s.ios.deployment_target = '7.0'
  s.source_files = 'CMBPay/Classes/**/*.{h,m}'
  s.resource_bundles = {
   'CMBPay' => ['CMBPay/Assets/*.png']
  }
  s.vendored_frameworks = 'CMBPay/Classes/cmbkeyboard.framework'
  s.frameworks = 'UIKit', 'MapKit'
end
