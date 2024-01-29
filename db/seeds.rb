# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

def generate_coordinates
  "-16.6035#{rand(0..999).to_s.rjust(3, '0')},-49.2670#{rand(0..999).to_s.rjust(3, '0')}"
end



def create_slot(sensor_id)
  Slot.create!(
    coordinates: generate_coordinates,
    sensor_id: sensor_id,
    occupied: [false, true].sample
  )
end

ActiveRecord::Base.transaction do
  30.times do |id|
    create_slot("sensor_inf_#{id.to_s.rjust(3, '0')}")
  end
end
