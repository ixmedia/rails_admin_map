module RailsAdmin::Config::Fields::Types
  class Coordinates < RailsAdmin::Config::Fields::Base

    RailsAdmin::Config::Fields::Types::register(:coordinates, self)

    register_instance_option(:partial) do
      :coordinates
    end
  end
end
