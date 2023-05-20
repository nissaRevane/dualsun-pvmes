# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PvmesFormConstructor do
  describe '#call' do
    context 'with valid payload' do
      let(:valid_payload) do
        {
          address: {
            number: '3 bis',
            street: 'rue Hector Berlioz',
            zip_code: '69009',
            city: 'Lyon',
            country: 'France'
          },
          installation: {
            start_date: DateTime.new(2022, 1, 17),
            number_of_panels: 3
          },
          company: {
            name: 'Photobomb',
            immatriculation: '912834756'
          },
          customer: {
            name: 'Mélanie Wayon',
            email: 'melanie@wayon-family.com',
            phone_number: '0674659876'
          },
          panels: [
            { technology: 'photovoltaic', serial_number: '400001' },
            { technology: 'photovoltaic', serial_number: '400002' },
            { technology: 'photovoltaic', serial_number: '400003' }
          ]
        }
      end

      it 'creates a pvmes_form' do
        expect { described_class.new(valid_payload).call }
          .to change { PvmesForm.count }.by(1)
      end

      it 'creates an address only if it do not exists' do
        existing_adress = FactoryBot.create(:address)
        expect { described_class.new(valid_payload).call }.to(
          change { Address.count }.by(1)
        )

        valid_payload[:address] = {
          number: existing_adress.number,
          street: existing_adress.street,
          zip_code: existing_adress.zip_code,
          city: existing_adress.city,
          country: existing_adress.country
        }
        expect { described_class.new(valid_payload).call }.to(
          change { Address.count }.by(0)
        )
      end

      it 'creates an installation only if it do not exists' do
        existing_installation = FactoryBot.create(:installation)
        existing_adress = FactoryBot.create(:address)

        expect { described_class.new(valid_payload).call }.to(
          change { Installation.count }.by(1)
        )

        valid_payload[:installation] = {
          start_date: existing_installation.start_date,
          number_of_panels: existing_installation.number_of_panels
        }
        valid_payload[:address] = {
          number: existing_adress.number,
          street: existing_adress.street,
          zip_code: existing_adress.zip_code,
          city: existing_adress.city,
          country: existing_adress.country
        }
        expect { described_class.new(valid_payload).call }.to(
          change { Installation.count }.by(0)
        )
      end

      it 'creates a company only if it do not exists' do
        existing_company = FactoryBot.create(:company)
        expect { described_class.new(valid_payload).call }.to(
          change { Company.count }.by(1)
        )

        valid_payload[:company] = {
          name: existing_company.name,
          immatriculation: existing_company.immatriculation
        }
        expect { described_class.new(valid_payload).call }.to(
          change { Company.count }.by(0)
        )
      end

      it 'creates a customer only if it do not exists' do
        existing_customer = FactoryBot.create(:customer)
        expect { described_class.new(valid_payload).call }.to(
          change { Customer.count }.by(1)
        )

        valid_payload[:customer] = {
          name: existing_customer.name,
          email: existing_customer.email,
          phone_number: existing_customer.phone_number
        }
        expect { described_class.new(valid_payload).call }.to(
          change { Customer.count }.by(0)
        )
      end

      it 'creates panels' do
        expect { described_class.new(valid_payload).call }.to(
          change { Panel.count }.by(3)
        )
      end

      it 'returns the created pvmes_form id' do
        expect(described_class.new(valid_payload).call).to(
          eq(PvmesForm.last.id)
        )
      end
    end

    context 'with incomplete payload' do
      let(:incomplete_payload) do
        {
          installation: {
            start_date: DateTime.new(2022, 1, 17),
            number_of_panels: 3
          },
          company: {
            name: 'Photobomb',
            immatriculation: '912834756'
          },
          customer: {
            name: 'Mélanie Wayon',
            email: 'melanie@wayon-family.com',
            phone_number: '0674659876'
          }
        }
      end

      it 'does not create any record' do
        expect { described_class.new(incomplete_payload).call }.not_to(
          change do 
            [
              PvmesForm.count,
              Address.count,
              Installation.count,
              Company.count,
              Panel.count
            ]
          end
        )
      end

      it 'store the error messages' do
        constructor = described_class.new(incomplete_payload)
        constructor.call
        expect(constructor.errors).to(
          eq(['Missing key address', 'Missing key panels'])
        )
      end
    end

    context 'with invalid payload' do
      let(:invalid_payload) do
        {
          address: {
            number: '3 bis',
            street: 'rue Hector Berlioz',
            zip_code: '69',
            city: 'Lyon',
            country: 'France'
          },
          installation: {
            start_date: DateTime.new(2022, 1, 17),
            number_of_panels: 3
          },
          company: {
            name: 'Photobomb',
            immatriculation: '916'
          },
          customer: {
            name: 'Mélanie',
            email: 'Wayon',
            phone_number: '0674659876'
          },
          panels: [
            { technology: 'photovoltaic', serial_number: '400001' },
            { technology: 'photovoltaic', serial_number: '400002' },
            { technology: 'photovoltaic', serial_number: '400003' }
          ]
        }
      end

      it 'does not create any record' do
        expect { described_class.new(invalid_payload).call }.not_to(
          change do 
            [
              PvmesForm.count,
              Address.count,
              Installation.count,
              Company.count,
              Panel.count
            ]
          end
        )
      end

      it 'store the error messages' do
        constructor = described_class.new(invalid_payload)
        constructor.call
        expect(constructor.errors).to(
          eq(['Validation failed: Zip code must be 5 numbers'])
        )
      end
    end
  end
end
