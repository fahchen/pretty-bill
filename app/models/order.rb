class Order < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :customer
end
