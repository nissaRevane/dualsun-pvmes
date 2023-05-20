# frozen_string_literal: true

class Panel < ApplicationRecord
  belongs_to :installation

  validates :type, :serial_number, presence: true
  validates :type, inclusion: { in: %w[hybrid photovoltaic] }
  validates :serial_number, format: { with: /\A\d{6}\z/ }
  validates :serial_number, uniqueness: true
end
