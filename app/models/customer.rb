class Customer < ActiveRecord::Base
  include Addressable

  enum gender: [:male, :female]

  validates :name, presence: true
  validates :phone, presence: true
  validates :gender, presence: true

  has_many :orders, dependent: :destroy
end
