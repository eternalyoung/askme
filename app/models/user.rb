class User < ApplicationRecord
  has_secure_password

  before_validation :downcase_nickname

  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w_+.\-]+@[\w\-]+(\.[\w\-]+)*\.[a-zA-Z]+\Z/ }
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 }, format: { with: /\A[\da-z_]*\Z/ }
  validates :header_color, format: { with: /\A#[a-z0-9]{6}\Z/ }

  has_many :questions, dependent: :delete_all

  def downcase_nickname
    nickname.downcase!
  end
end
