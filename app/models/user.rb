class User < ApplicationRecord
  has_many :quizes


  validates :name, :email, presence: true
  validates :email, uniqueness: true


  enum role:
  {
    regular: 0,
    admin: 1
  }

end
