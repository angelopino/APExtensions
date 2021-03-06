Pod::Spec.new do |s|

  s.name         = "APJExtensions"
  s.version      = "0.0.32"
  s.summary      = "Base extensions for a new project"
  s.description  = <<-DESC
                    APJExtensions provides a base extensions for a new project.
                   DESC
  s.homepage     = "https://github.com/angelopino/APJExtensions"
  s.license      = "MIT"
  s.author       = { "Angelo Pino" => "pino.angelo@gmail.com" }
  s.platform     = :ios, "13.0"
  s.source       = { :git => "https://github.com/angelopino/APJExtensions.git", :tag => "#{s.version}" }
  s.source_files = 'Source/*.swift'
  s.swift_versions = '5.0'
end
