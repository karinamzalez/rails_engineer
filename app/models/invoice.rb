class Invoice < ApplicationRecord
  validates :customer_id, presence: true
  validates :merchant_id, presence: true
  validates :status, presence: true

  belongs_to :merchant
  belongs_to :customer

  has_many   :transactions
  has_many   :invoice_items
  has_many   :items, through: :invoice_items

  scope :successful, -> {joins(:transactions).where(transactions: {result: 'success'})}
  
  def self.random_id
    pluck(:id).shuffle.pop
  end
end
