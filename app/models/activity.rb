class Activity < ActiveRecord::Base
	belongs_to :user
  has_many :activities_goals
  has_many :goals, through: :activities_goals
  validates :title, presence: true, length: { maximum: 50 }
  validates :user_id, presence: true

  # Returns activities from the users being folllowed by the given user.
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                          WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", user_id: user.id)
  end
end
