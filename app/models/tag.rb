class Tag < ApplicationRecord
  validates :name, presence: true, uniqueness: true, format: { with: /\A[\p{L}\d]+\z/ }

  has_many :questions_tags
  has_many :questions, through: :questions_tags
end
