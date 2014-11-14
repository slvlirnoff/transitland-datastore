# == Schema Information
#
# Table name: stops
#
#  id         :integer          not null, primary key
#  onestop_id :string(255)
#  geometry   :spatial          geometry, 4326
#  tags       :hstore
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#
# Indexes
#
#  index_stops_on_onestop_id  (onestop_id)
#

FactoryGirl.define do
  factory :stop do
    geometry { "POINT(#{rand(-124.4096..-114.1308)} #{rand(32.5343..42.0095)})" }
    name { [
      'C. Chavez St & Florida St',
      'Metro Embarcadero Station',
      'West Portal/Sloat/St Francis Circle'
    ].sample }
  end
end
