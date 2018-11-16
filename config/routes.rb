RailsAdminMap::Engine.routes.draw do
  post     '/geocode'       => 'services#geocode', as: 'map_geocode'
end
