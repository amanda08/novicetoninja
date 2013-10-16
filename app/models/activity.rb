class Activity < ActiveRecord::Base
	belongs_to :user
  has_many :activities_goals
  has_many :goals, through: :activities_goals
end
