# frozen_string_literal: true

class PvmesFormConstructor
  def initialize(payload)
    @payload = payload
  end

  attr_reader :payload

  def call
    ActiveRecord::Base.transaction do
      address = Address.find_or_create_by!(**payload[:address])
      installation = Installation.find_or_create_by(
        address: address,
        **payload[:installation]
      )
      find_or_create_panels(installation, payload[:panels])
      company = Company.find_or_create_by(payload[:company])
      customer = Customer.find_or_create_by(payload[:customer])

      PvmesForm.create!(
        installation: installation,
        company: company,
        customer: customer
      )
    end
  end
end

def find_or_create_panels(installation, panels)
  panels.each do |panel|
    Panel.find_or_create_by(installation: installation, **panel)
  end
end
