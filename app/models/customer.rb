class Customer < ActiveRecord::Base
  enum gender: [:male, :female]

  validates :name, presence: true
  validates :phone, presence: true
  validates :gender, presence: true
end
