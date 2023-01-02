class Tag < ApplicationRecord
  validates :name, presence: true, uniqueness: true, format: { with: /\A[\p{L}\d]+\z/ }

  has_many :questions_tags
  has_many :questions, through: :questions_tags

  def with_sign
    "##{name}"
  end

  def to_param
    name
  end
end
