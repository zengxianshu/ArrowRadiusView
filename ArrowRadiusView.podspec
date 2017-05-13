
Pod::Spec.new do |s|

s.name         = "ArrowRadiusView"
s.version      = "0.0.1"
s.summary      = "带箭头的圆角View"

s.homepage     = "https://github.com/zengxianshu/ArrowRadiusView"

s.license      = "MIT"

s.author       = { "zengXianShu" => "zengxianshu0@163.com" }
s.platform     = :ios, "9.0"

s.source       = { :git => "https://github.com/zengxianshu/ArrowRadiusView.git", :tag => s.version }

s.source_files = "Pods/ArrowRadiusView/*.swift"

s.requires_arc = true

end
