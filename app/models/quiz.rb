class Quiz < ApplicationRecord
  belongs_to :user
  has_many :question

  validates :title, :description, presence: true

end
