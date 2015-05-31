class OrderItem < ActiveRecord::Base
  belongs_to :order, touch: true
  belongs_to :product

  validates :product, presence: true
  validates :discount, presence: true

  after_initialize :update_total

  def quantity_with_unit
    "#{quantity} #{product.unit}"
  end

  private
  def update_total
    if product
      self.price = product.price
      self.total = price * quantity.to_i * discount
    end
  end
end
