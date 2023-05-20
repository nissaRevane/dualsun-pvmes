# frozen_string_literal: true

class PvmesFormConstructor
  def initialize(payload)
    @payload = payload
    @errors = []
  end

  attr_reader :payload
  attr_accessor :errors

  def call
    return if check_payload_contains_keys.any?

    ActiveRecord::Base.transaction do
      address = Address.find_or_create_by!(**payload[:address])
      installation = Installation.find_or_create_by(
        address: address,
        **payload[:installation]
      )
      find_or_create_panels(installation, payload[:panels])
      company = Company.find_or_create_by(payload[:company])
      customer = Customer.find_or_create_by(payload[:customer])

      pvmes_form = PvmesForm.create!(
        installation: installation,
        company: company,
        customer: customer
      )
      pvmes_form.id
    end
  rescue ActiveRecord::RecordInvalid => e
    @errors << e.message
    false
  end
end

MANDATORY_KEYS = %i[
  address
  installation
  panels
  company
  customer
].freeze

def check_payload_contains_keys
  MANDATORY_KEYS.each do |key|
    @errors << "Missing key #{key}" unless payload.key?(key)
  end

  @errors
end

def find_or_create_panels(installation, panels)
  panels.each do |panel|
    Panel.find_or_create_by(installation: installation, **panel)
  end
end
