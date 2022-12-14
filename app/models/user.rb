class User < ApplicationRecord
  has_secure_password

  before_validation :downcase_nickname

  validates :email, presence: true, uniqueness: true, format: { with: /\A[a-z\d_+.\-]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\Z/ }

  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 }, format: { with: /\A[\da-z_]*\Z/ }  

  def downcase_nickname
    nickname.downcase! 
  end
end
