class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true

  validates :zip_code, presence: true
  validates :detail, presence: true
end
