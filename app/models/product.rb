class Product < ActiveRecord::Base
  belongs_to :merchant
  has_many :order_items, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true
  validates :unit, presence: true
end
