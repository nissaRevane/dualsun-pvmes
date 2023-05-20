# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    number { '29 ter' }
    street { 'rue Roger Salangro' }
    zip_code { '59300' }
    city { 'Valenciennes' }
    country { 'France' }
  end
end
