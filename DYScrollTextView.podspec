
Pod::Spec.new do |s|


s.name         = "DYScrollTextView"
s.version      = "1.0.0"
s.summary      = "一个高度自定义的文字滚动视图"

s.description  = <<-DESC
一个高度自定义的文字滚动视图，可改变滚动方向。
DESC

s.homepage     = "https://github.com/duyi56432/DYScrollTextView"

s.license      = "MIT"

s.author             = { "duyi56432" => "564326678@qq.com" }
s.frameworks   = "Foundation"
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/duyi56432/DYScrollTextView.git", :tag => "#{s.version}" }


s.source_files  = "DYScrollTextView/**/*.{h,m}"


end
