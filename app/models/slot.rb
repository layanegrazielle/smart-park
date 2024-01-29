class Slot < ApplicationRecord
  validates :coordinates, presence: true
  validates :sensor_id, presence: true
end
