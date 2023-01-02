class Question < ApplicationRecord
  validates :body, presence: true, length: { maximum: 280 }

  belongs_to :user
  belongs_to :asker, class_name: 'User', optional: true

  has_many :questions_tags
  has_many :tags, through: :questions_tags

  after_create :tags_analyzer
  before_update :tags_clear
  before_update :tags_analyzer

  def tags_analyzer
    hashtags = body.scan(/#[\p{L}\d]+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      tags << (tag)
    end
  end

  def tags_clear
    tags.clear
  end
end
