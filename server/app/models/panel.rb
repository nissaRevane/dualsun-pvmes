# frozen_string_literal: true

class Panel < ApplicationRecord
  belongs_to :installation

  validates :technology, :serial_number, presence: true
  validates :technology, inclusion: { in: %w[hybrid photovoltaic] }
  validates :serial_number, format: { with: /\A\d{6}\z/ }
  validates :serial_number, uniqueness: true
end
