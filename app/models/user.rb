class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  has_many :activities, dependent: :destroy
  has_many :goals, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :followers, through: :reverse_relationships, source: :follower
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :bio, length: { maximum: 140 }, allow_blank: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }, allow_blank: true

  def self.search(query)
    if query.blank?
      scoped
    else
      sql = query.split.map do |word|
       %w[first_name last_name].map do |column|
        sanitize_sql ["#{column} LIKE ?", "%#{word}%"]
       end.join(" or ")
      end.join(") and (")
      where("(#{sql})")
    end
  end


  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def name
    [first_name, last_name].join(' ')
  end

  def feed
    # old implementation: Activity.where("user_id = ?", id)
    Activity.from_users_followed_by(self).order(created_at: :desc)
  end

  

  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end 

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy!
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

    def generate_token(column)
      self[column] = SecureRandom.urlsafe_base64
    end

end
