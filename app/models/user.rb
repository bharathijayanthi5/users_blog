class User < ApplicationRecord

  has_many :articles
  has_many :comments
  before_save { self.email = email.downcase }
  validates :username, presence: true, uniqueness: { case_sensitive: false },
                                      length: { minimum: 3, maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, uniqueness: { case_sensitive: false },
                                      length: { maximum: 250 },
                                      format: { with: VALID_EMAIL_REGEX }
  has_secure_password
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
