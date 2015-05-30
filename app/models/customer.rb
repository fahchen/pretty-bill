class Customer < ActiveRecord::Base
  validates :name, presence: true
  validates :phone, presence: true
  validates :gender, presence: true
end
