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

    def dom_name
      @dom_name ||= "#{bindings[:form].object_name}_#{@name}_#{longitude_field}"
    end

    def latitude_dom_name
      @lat_dom_name ||= "#{bindings[:form].object_name}_#{latitude_field}"
    end

    def longitude_dom_name
      @lon_dom_name ||= "#{bindings[:form].object_name}_#{longitude_field}"
    end
  end
end
