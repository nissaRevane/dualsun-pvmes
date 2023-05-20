# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PvmesFormsController, type: :controller do
  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_params) do
        {
          address: {
            number: '56',
            street: 'boulevard de la Pelude',
            zip_code: '31400',
            city: 'Toulouse',
            country: 'France'
          },
          installation: {
            start_date: DateTime.new(2019, 12, 7),
            number_of_panels: 3
          },
          company: {
            name: 'Forza Viola',
            immatriculation: '912800756'
          },
          customer: {
            name: 'Andrea Tolosa',
            email: 'andrea@forza-viola.eu',
            phone_number: '0670659876'
          },
          panels: [
            { technology: 'photovoltaic', serial_number: '400004' },
            { technology: 'photovoltaic', serial_number: '400005' },
            { technology: 'photovoltaic', serial_number: '400006' }
          ]
        }.to_json
      end

      it 'creates a new PvmesForm' do
        expect { post :create, params: { body: valid_params } }.to(
          change(PvmesForm, :count).by(1)
        )
      end

      it 'renders a JSON response with the new pvmes_form id' do
        post :create, params: { body: valid_params }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(JSON.parse(response.body)['id']).to eq(PvmesForm.last.id)
      end
    end

    context 'with invalid params' do
      let(:invalid_params) do
        {
          installation: {},
          company: {},
          customer: {}
        }.to_json
      end

      it 'renders a JSON response with errors for the new pvmes_form' do
        post :create, params: { body: invalid_params }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(JSON.parse(response.body)['errors']).to(
          eq(['Missing key address', 'Missing key panels'])
        )
      end
    end
  end
end
