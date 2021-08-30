 class Response < ApplicationRecord
  belongs_to :question
  validates :content, presence: true
  has_many :response_projects, dependent: :destroy
end
