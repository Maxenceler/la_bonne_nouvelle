class Question < ApplicationRecord
  belongs_to :step
  has_many :responses
  has_one_attached :photo
end
