require 'typhoeus'

desc "Fetch API school data"
task :api_schools => :environment do
  doc = Typhoeus.get('http://aws.code.org/schools.json')
  results = JSON.parse(doc.body)
  new_results = results["schools"]
  new_results.each do |school|
    name = school["name"]
    website = school["website"]
    levels = school["levels"]
    format_description = school["format_description"]
    description = school["description"]
    languages = school["languages"]
    contact_email = school["contact_email"]
    phone = school["contact_number"]
    street = school["street"]
    city = school["city"]
    state = school["state"]
    zip = school["zip"]
    country = school["country"]
    latitude = school["latitude"]
    longitude = school["longitude"]
    OfflineSchool.create(languages: languages, contact_email: contact_email,
      phone: phone, bio: description, city: city,
      ed_level: levels, format: format_description, name: name,
      site_url: website, state: state, zip_code: zip, street: street,
      latitude: latitude, longitude: longitude)
  end
end