require 'rails/generators'
module RailsAdminMap
  module Generators
    class InstallGenerator < Rails::Generators::Base

      # desc "Installs RailsAdminMap into your app."

      def setup_route
        route "mount RailsAdminMap::Engine => '/rails-admin-map', as: 'admin_map'"
      end

    end
  end
end
