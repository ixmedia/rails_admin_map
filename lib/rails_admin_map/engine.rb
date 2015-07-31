module RailsAdminMap
  class Engine < ::Rails::Engine
    isolate_namespace RailsAdmin

    initializer "RailsAdminJcrop precompile hook" do |app|
      app.config.assets.precompile += ['rails_admin/rails_admin_map.css']
    end
  end
end
