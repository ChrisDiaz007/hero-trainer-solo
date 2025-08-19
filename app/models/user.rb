class User < ApplicationRecord
  include PgSearch::Model
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  pg_search_scope :search_by_name,
                  against: [ :name ], # só :title
                  using: { tsearch: { prefix: true } }


  has_many :lessons, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :lessons
  # validates :name, presence: true, uniqueness: true
  # validates :bio, presence: true, length: { minimum: 10, maximum: 360 }
  # validates :experience, length: { minimum: 10, maximum: 500 }
  # validates :specialties, length: { minimum: 10, maximum: 200 }
  has_one_attached :photo, dependent: :purge_later
end
