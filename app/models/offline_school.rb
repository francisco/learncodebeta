class OfflineSchool < ActiveRecord::Base
  attr_accessible :bio, :city, :contact_email, :country, :ed_level, :format, :languages, :latitude, :longitude, :name, :phone, :site_url, :state, :street, :zip_code

  def full_address
    [street, city, state, zip_code, country].compact.join(', ')
  end

  geocoded_by :full_address
  after_validation :geocode, if: ->(obj){ !obj.latitude.present? and !obj.longitude.present? }
end
