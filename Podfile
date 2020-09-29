platform :ios, '12.0'
use_frameworks!

def networking
    pod 'Alamofire', '4.8.2'
end

def ui
    pod 'SVProgressHUD', '2.2.5'
end

target 'GLucenaTest' do
  ui
  networking
end

target 'GLucenaTestTests' do
    inherit! :search_paths
    pod 'Mocker', '2.0.0'
end
