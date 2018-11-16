
module RailsAdminMap
  class ServicesController < RailsAdmin::ApplicationController
    def geocode()
      require 'net/http'
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{Rails.application.config.geo_api_key}&address=#{params[:address]}"

      response = Net::HTTP.get_response(URI.parse(url))
      render json: response.body
    end
  end
end
