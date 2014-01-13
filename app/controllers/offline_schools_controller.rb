class OfflineSchoolsController < ApplicationController

  def index
    search_query = params[:address_search]
    if search_query
      query = URI::escape(search_query)
      result = Typhoeus.get("http://maps.googleapis.com/maps/api/geocode/json?address=#{query}&sensor=true")
      result_hash = JSON.parse(result.body)
      result_hash["results"].each do |result|
        @lat = result["geometry"]["location"]["lat"]
        @lng = result["geometry"]["location"]["lng"]
      end
    end
    respond_to do |format|
      format.html
      format.json {
        # lat = params[:lat]
        # lng = params[:lng]
        render json: {
          lat: @lat,
          lng: @lng
        }
      }
    end
  end

  def new
  end
end
