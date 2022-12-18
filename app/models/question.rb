class Question < ApplicationRecord
  validates :body, presence: true, length: { maximum: 280 }

  belongs_to :user
  belongs_to :asker, class_name: 'User', optional: true
end
