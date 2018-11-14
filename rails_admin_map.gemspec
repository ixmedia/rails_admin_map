$:.push File.expand_path("../lib", __FILE__)

require 'rails_admin_map/version'

Gem::Specification.new do |s|
  s.add_runtime_dependency 'rails', ['>= 4.1', '< 5.2']
  s.add_runtime_dependency 'rails_admin', ['>= 0.6', '< 2.0']

  s.name              = "rails_admin_map"
  s.version           = RailsAdminMap::VERSION
  s.platform          = Gem::Platform::RUBY
  s.authors           = ["Louis-Philippe Dumas", "Vincent Ouellet"]
  s.email             = ["louis.philippe.dumas@gmail.com", "vincent.ouellet@gmail.com"]
  s.homepage          = "https://github.com/ixmedia/rails_admin_map"
  s.license           = "MIT"
  s.summary           = "Add a coordinate field with a google map handler to place markers"
  s.description       = "Add a coordinate field with a google map handler to place markers auto updating the fields"

  s.files             = Dir["{lib,app,vendor}/**/*"] + ["README.md"]
  s.require_path      = 'lib'
  s.license           = 'MIT'
end
