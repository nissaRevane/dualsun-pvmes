# frozen_string_literal: true

Address.create(
  number: '10',
  street: 'boulevard des Maguelone',
  zip_code: '34000',
  city: 'Montpellier',
  country: 'France'
)
Company.create(
  name: "Les compagnons de l'énergie",
  immatriculation: '214365879'
)
Customer.create(
  name: 'Boulangerie du coin',
  email: 'baker@coin.fr',
  phone_number: nil
)
