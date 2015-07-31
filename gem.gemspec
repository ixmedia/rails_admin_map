# coding: UTF-8

Gem::Specification.new do |s|
  s.add_runtime_dependency 'rails', '~> 4.0', '>= 4.0.0'
  s.add_runtime_dependency 'rails_admin', '~> 0.6', '> 0.6.5'

  s.name              = "rails_admin_map"
  s.version           = "0.1.0"
  s.platform          = Gem::Platform::RUBY
  s.authors           = ["Louis-Philippe Dumas"]
  s.email             = ["louis.philippe.dumas@gmail.com"]
  s.homepage          = "http://github.com/lpdumas/"
  s.license           = "MIT"
  s.summary           = "Add a coordinate field with a google map handler to place markers"
  s.description       = "Add a coordinate field with a google map handler to place markers auto updating the fields"

  s.files             = Dir["{lib,app}/**/*"] + ["README.md"]
  s.require_path      = 'lib'
  s.license           = 'MIT'
end