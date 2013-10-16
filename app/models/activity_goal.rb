class Activity_Goal < ActiveRecord::Base
  belongs_to :goal
  belongs_to :activity
end
