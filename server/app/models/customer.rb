# frozen_string_literal: true

class Customer < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, uniqueness: true
  validates :phone_number, format: { with: /\A\d{10}\z/ }, allow_blank: true
end
