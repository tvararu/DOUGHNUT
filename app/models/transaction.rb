class Transaction < ActiveRecord::Base
  attr_accessible :date, :description, :value
  
  belongs_to :user
  
  validates :user_id, presence: true
  validates :description, length: { maximum: 255 }
end