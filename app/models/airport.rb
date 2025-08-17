class Airport < ApplicationRecord
  validates :code, presence: true, uniqueness: true

  has_many :arriving_flights, foreign_key: :arrival_airport_id, dependent: :destroy, class_name: "Flight"

  has_many :departing_flights, foreign_key: :departure_airport_id, dependent: :destroy, class_name: "Flight"
end
