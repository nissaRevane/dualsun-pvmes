# frozen_string_literal: true

FactoryBot.define do
  factory :panel do
    installation
    technology { 'hybrid' }
    serial_number { '900001' }
  end
end
