class Product < ActiveRecord::Base
  belongs_to :merchant
  has_many :order_items, dependent: :destroy
end
