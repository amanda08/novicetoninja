class Goal < ActiveRecord::Base
  belongs_to :user
  has_many :activities_goals
  has_many :activities, through: :activities_goals
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
end
