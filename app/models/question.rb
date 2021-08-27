class Question < ApplicationRecord
  belongs_to :step
  has_many :responses
end
