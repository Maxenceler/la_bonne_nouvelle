class ResponseProject < ApplicationRecord
  belongs_to :response
  belongs_to :project

  validates :response_id, uniqueness: { scope: :project_id}
end
