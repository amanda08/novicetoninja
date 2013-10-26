class Activity < ActiveRecord::Base
	belongs_to :user
  has_many :activities_goals
  has_many :goals, through: :activities_goals
  validates :title, presence: true, length: { maximum: 50 }
  validates :user_id, presence: true
end
