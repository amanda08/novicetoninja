class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  has_many :activities
  attr_accessor :email, :first_name, :last_name
  attr_accessor :password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

end
