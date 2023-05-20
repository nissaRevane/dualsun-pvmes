class Installation < ApplicationRecord
  belongs_to :address

  validates :start_date, :number_of_panels, presence: true
end
