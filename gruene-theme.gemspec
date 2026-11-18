# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "gruene-theme"
  spec.version       = "0.1.0"
  spec.authors       = ["Jan"]
  spec.summary       = "Jekyll-Theme für grüne Orts- und Kreisverbände (inoffiziell)"
  spec.homepage      = "https://github.com/CHANGEME/gruene-theme"
  spec.license       = "MIT"

  spec.files = Dir.glob("{_layouts,_includes,_sass,assets}/**/*") + %w[_config.yml LICENSE README.md]

  spec.required_ruby_version = ">= 2.7"
  spec.add_runtime_dependency "jekyll", ">= 4.0", "< 5.0"
end
