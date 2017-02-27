# coding: UTF-8

Gem::Specification.new do |s|
  s.add_runtime_dependency 'rails', '~> 5.0'
  s.add_runtime_dependency 'rails_admin', '~> 1.0'

  s.name              = "rails_admin_map"
  s.version           = "0.1.8"
  s.platform          = Gem::Platform::RUBY
  s.authors           = ["Louis-Philippe Dumas", "Vincent Ouellet"]
  s.email             = ["louis.philippe.dumas@gmail.com", "vincent.ouellet@gmail.com"]
  s.homepage          = "http://github.com/lpdumas/"
  s.license           = "MIT"
  s.summary           = "Add a coordinate field with a google map handler to place markers"
  s.description       = "Add a coordinate field with a google map handler to place markers auto updating the fields"

  s.files             = Dir["{lib,app,vendor}/**/*"] + ["README.md"]
  s.require_path      = 'lib'
  s.license           = 'MIT'
end
