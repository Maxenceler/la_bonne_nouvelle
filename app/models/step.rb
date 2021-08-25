class Step < ApplicationRecord
   has_many :questions
  validates :number, presence: true
  validates :title, presence: true
end
