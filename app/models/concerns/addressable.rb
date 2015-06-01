module Addressable
  extend ActiveSupport::Concern

  included do
    has_one :address, as: :addressable, dependent: :destroy

    accepts_nested_attributes_for :address
  end

  def full_address
    address && "#{ChinaCity.get(address.zip_code, prepend_parent: true)} #{address.detail}"
  end
end
