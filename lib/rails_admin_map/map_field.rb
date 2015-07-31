module RailsAdmin::Config::Fields::Types
  class Map < RailsAdmin::Config::Fields::Base

    RailsAdmin::Config::Fields::Types::register(:map, self)

    register_instance_option(:partial) do
      :coordinates
    end
  end
end
