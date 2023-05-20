# frozen_string_literal: true

class Installation < ApplicationRecord
  belongs_to :address
  has_many :panels, dependent: :destroy

  validates :start_date, :number_of_panels, presence: true
end
