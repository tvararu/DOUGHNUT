class Transaction < ActiveRecord::Base
  attr_accessible :date, :description, :value
  
  MoneyRails.configure do |config|
    config.default_currency = :ron
  end
  
  belongs_to :user
  
  validates :date, presence: true
  validates :user_id, presence: true
  validates :description, length: { maximum: 255 }
  
  default_scope order: 'transactions.created_at DESC'
end
