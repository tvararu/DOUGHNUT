class Transaction < ActiveRecord::Base
  attr_accessible :date, :description, :value
  
  MoneyRails.configure do |config|
    config.default_currency = :ron
  end
  
  belongs_to :user
  
  validates :date, presence: true
  validates :user_id, presence: true
  validates :description, length: { maximum: 255 }
  validates :value, presence: true
  
  default_scope order: 'transactions.date DESC'
end
