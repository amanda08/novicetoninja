class Goal < ActiveRecord::Base
  belongs_to :user
  has_many :contributions, dependent: :destroy
  has_many :activities, through: :contributions
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true

  def score 
    num = contributions.count
    [num,10].min
  end 
end
