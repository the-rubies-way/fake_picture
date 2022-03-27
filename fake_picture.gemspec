# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require_relative "lib/fake_picture/version"

Gem::Specification.new do |spec|
  spec.name          = "fake_picture"
  spec.version       = FakePicture::VERSION
  spec.authors       = ["loqimean"]
  spec.email         = ["vanuha277@gmail.com"]

  spec.summary       = "fake pictures"
  spec.description   = "simple way for fake pictures some categories"
  spec.homepage      = "https://github.com/loqimean/fake_picture"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = 'https://rubygems.org/'

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/loqimean/fake_picture"

  spec.files         = Dir['lib/**/*'] + %w[License.txt README.md]
  spec.bindir        = 'bin'
  spec.executables   = ['fake_picture']
  spec.require_paths = ['lib']

  spec.add_development_dependency('debug', '1.4')
  spec.add_development_dependency('rspec', '3.0')
  spec.add_development_dependency('simplecov')
end
