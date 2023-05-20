class PvmesForm < ApplicationRecord
  belongs_to :company
  belongs_to :customer
  belongs_to :installation
end
