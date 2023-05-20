# frozen_string_literal: true

class Address < ApplicationRecord
  validates :number, :street, :zip_code, :city, :country, presence: true
  validates :zip_code, format: { with: /\A\d{5}\z/, message: 'must be 5 numbers' }
end
