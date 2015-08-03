module RailsAdmin::Config::Fields::Types
  class Map < RailsAdmin::Config::Fields::Base

    RailsAdmin::Config::Fields::Types::register(:map, self)
    def allowed_methods
      [@name, longitude_field, latitude_field, default_zoom, default_longitude, default_latitude]
    end

    register_instance_option(:partial) do
      :map
    end

    register_instance_option(:default_zoom) do
        8
    end

    register_instance_option(:default_longitude) do
      -71.242796
    end

    register_instance_option(:default_latitude) do
      46.803283
    end

    register_instance_option(:longitude_field) do
      :longitude
    end

    register_instance_option(:latitude_field) do
      :latitude
    end

  end
end
