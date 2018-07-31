source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

def shared_pods
    pod 'Alamofire', '~> 4.7'
    pod 'Firebase/Core'
    pod 'Firebase/Firestore'
    pod 'ObjectMapper', '~> 3.1'
    pod 'OHHTTPStubs/Swift' # includes the Default subspec, with support for NSURLSession & JSON, and the Swiftier API wrappers
    pod 'AlamofireImage', '~> 3.3'
end

target 'Museo' do
    shared_pods
    pod 'FontAwesome.swift'
end

target 'MuseoTests' do
    shared_pods
end