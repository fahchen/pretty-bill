class Merchant < ActiveRecord::Base
  include Addressable

  validates :name, presence: true
  validates :tel, presence: true
  validates :email, presence: true

  has_many :orders, dependent: :destroy
  has_many :products, dependent: :destroy
end
