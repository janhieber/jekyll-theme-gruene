# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "jekyll-theme-gruene"
  spec.version       = "0.1.0"
  spec.authors       = ["Jan Hieber"]
  spec.summary       = "Jekyll-Theme für grüne Orts- und Kreisverbände (inoffiziell)"
  spec.homepage      = "https://github.com/janhieber/jekyll-theme-gruene"
  spec.license       = "MIT"

  spec.files = Dir.glob("{_layouts,_includes,_sass,assets}/**/*") + %w[_config.yml LICENSE README.md]

  spec.required_ruby_version = ">= 2.7"
  spec.add_runtime_dependency "jekyll", ">= 4.0", "< 5.0"
end
