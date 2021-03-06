
# Rails Admin Map field

A simple gem to work with [rails_admin](https://github.com/sferik/rails_admin) that allow coordinate field update via a google map.

## Usage


```ruby
gem "rails_admin_map"
```

Run this
```
rails generate rails_admin_map:install
```

Then add an ```attr_accessor :coordinates``` to your active record model

```ruby
class MyAwesomeModel < ActiveRecord::Base
  attr_accessor :coordinates
end
```

Then, add in your rails admin model initializer<br/>
``` config/initializers/rails_admin/modelName.rb ```

```ruby
RailsAdmin.config do |config|
  config.model MyAwesomeModel do
    edit do
      field :coordinates, :map
    end
  end
end
```

After, add you google map api key(s) to the `config/application.rb`
```ruby
# Map api key
config.map_api_key = 'YOUR_KEY_HERE'

# Map geocoding key (optional)
config.geo_api_key = 'YOUR_KEY_HERE'
```

## Config

- `latitude_field` - the name of the latitude field that forms the the co-ordinate with the latitude field specified. Defaults to "latitude"
- `longitude_field` - the name of the longitude field that forms the the co-ordinate with the latitude field specified. Defaults to "longitude"
- `default_zoom` - Map default zoom.
- `default_latitude` - Default latitude when latitude fields is empty
- `default_longitude` - Default latitude when longitude fields is empty
A more complicated configuration example:

```ruby
RailsAdmin.config do |config|
  config.model MyAwesomeModel do
    edit do
      field :coordinates, :map do
        latitude_field :latitude
        longitude_field :longitude
        default_latitude 40.712784
        default_longitude -74.005941
        default_zoom 10
      end
    end
  end
end
```
