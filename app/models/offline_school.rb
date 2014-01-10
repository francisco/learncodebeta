class OfflineSchool < ActiveRecord::Base
  attr_accessible :bio, :city, :contact_email, :country, :ed_level, :format, :languages, :latitude, :longitude, :name, :phone, :site_url, :state, :street, :zip_code
end
