class Address < ActiveRecord::Base
  validates :zip_code, presence: true
  validates :detail, presence: true
end
