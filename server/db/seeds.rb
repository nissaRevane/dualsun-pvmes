# frozen_string_literal: true

address = Address.create!(
  number: '10',
  street: 'boulevard des Maguelone',
  zip_code: '34000',
  city: 'Montpellier',
  country: 'France'
)
company = Company.create!(
  name: "Les compagnons de l'énergie",
  immatriculation: '214365879'
)
customer = Customer.create!(
  name: 'Boulangerie du coin',
  email: 'baker@coin.fr',
  phone_number: nil
)
installation = Installation.create!(
  address: address,
  number_of_panels: 9,
  start_date: DateTime.new(2021, 05, 19)
)

(1..9).each do |i|
  Panel.create!(
    installation: installation,
    technology: 'hybrid',
    serial_number: "90000#{i}"
  )
end

PvmesForm.create!(
  company: company,
  customer: customer,
  installation: installation
)
