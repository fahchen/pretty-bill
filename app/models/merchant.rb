class Merchant < ActiveRecord::Base
  validates :name, presence: true
  validates :tel, presence: true
  validates :email, presence: true

  has_many :orders, dependent: :destroy
end
