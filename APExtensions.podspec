Pod::Spec.new do |s|

  s.name         = "APExtensions"
  s.version      = "0.0.2"
  s.summary      = "Base extensions for a new project"
  s.description  = <<-DESC
                    APExtensions provides a base extensions for a new project.
                   DESC
  s.homepage     = "https://github.com/angelopino/APExtensions"
  s.license      = "MIT"
  s.author       = { "Angelo Pino" => "pino.angelo@gmail.com" }
  s.platform     = :ios, "10.0"
  s.source       = { :git => "https://github.com/angelopino/APExtensions.git", :tag => "#{s.version}" }
  s.source_files = 'Source/*.swift'
end