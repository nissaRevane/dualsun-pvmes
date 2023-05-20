# frozen_string_literal: true

class Company < ApplicationRecord
  validates :name, :immatriculation, presence: true
  validates :immatriculation, format: { with: /\A\d{9}\z/, message: 'must be 9 numbers' }
end
