class Project < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :response_projects

  validates :address, presence: true
  validates :project_type, presence: true
  validates :title, presence: true
  has_many_attached :photos
  has_one_attached :main_photo
end
