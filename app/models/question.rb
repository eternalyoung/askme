class Question < ApplicationRecord
  validates :body, presence: true, length: { maximum: 280 }

  belongs_to :user
  belongs_to :asker, class_name: 'User', optional: true

  has_many :questions_tags
  has_many :tags, through: :questions_tags

  after_save :fetch_tags
  before_update :clear_tags

  def fetch_tags
    hashtags = body.scan(/#[\p{L}\d]+/)
    hashtags.each do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      tags.push(tag) unless tags.include?(tag)
    end
  end

  def clear_tags
    tags.clear
  end
end
