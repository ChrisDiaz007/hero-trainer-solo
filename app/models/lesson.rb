class Lesson < ApplicationRecord
  include PgSearch::Model
  # mudar para :search_by_title
  pg_search_scope :search_by_title_and_category,
                  against: [ :title, :category ], # só :title
                  using: { tsearch: { prefix: true } }

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10, maximum: 400 }
  validates :duration, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 5 }
  validates :address, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }
  has_many_attached :photos, dependent: :purge_later
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  CATEGORIES = ["Martial Arts", "Strength", "Endurance", "Combat Training", "Tactical Combat", "Dance"]

end
