# platform :ios, '9.0'

target 'DotaPocket' do
  use_frameworks!

  pod 'Texture'
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'Moya/RxSwift'

  target 'DotaPocketTests' do
    inherit! :search_paths
    pod 'RxNimble', subspecs: ['RxBlocking', 'RxTest']
    pod 'Quick'
  end

end
