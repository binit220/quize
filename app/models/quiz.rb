class Quiz < ApplicationRecord
  belongs_to :user

  validates :title, :description, presence: true

  validate :only_admin_can_create

  private

  def only_admin_can_create
    return if user&.admin?   # allow only admins

    errors.add(:base, "Only admin users can create quizzes")
  end
end
