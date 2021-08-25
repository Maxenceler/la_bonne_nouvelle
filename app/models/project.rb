class Project < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :response_projects

  validates :address, presence: true
  validates :type, presence: true
  validates :title, presence: true
end
