class Customer < ActiveRecord::Base
  GENDER = {
    male: '先生',
    female: '女士'
  }

  include Addressable

  enum gender: [:male, :female]

  validates :name, presence: true
  validates :phone, presence: true
  validates :gender, presence: true

  has_many :orders, dependent: :destroy

  def human_gender
    GENDER[gender.to_sym]
  end
end
