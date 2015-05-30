class Order < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :customer
  has_many :order_items, dependent: :destroy

  validates :merchant, presence: true
  validates :customer, presence: true

  accepts_nested_attributes_for :customer
  accepts_nested_attributes_for :order_items, allow_destroy: true
end
