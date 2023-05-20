# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Panel, type: :model do
  it 'should be valid with valid attributes' do
    expect(FactoryBot.build(:panel)).to be_valid
    expect(FactoryBot.build(:panel, type: nil)).to_not be_valid
    expect(FactoryBot.build(:panel, serial_number: nil)).to_not be_valid
  end

  describe 'type' do
    it 'should be valid with valid types' do
      expect(FactoryBot.build(:panel, type: 'hybrid')).to be_valid
      expect(FactoryBot.build(:panel, type: 'photovoltaic')).to be_valid
      expect(FactoryBot.build(:panel, type: 'road')).not_to be_valid
    end
  end

  describe 'serial_number' do
    it 'should be valid with valid serial numbers' do
      expect(FactoryBot.build(:panel, serial_number: '900001')).to be_valid
      expect(FactoryBot.build(:panel, serial_number: '9000001')).not_to be_valid
      expect(FactoryBot.build(:panel, serial_number: '90000')).not_to be_valid
      expect(FactoryBot.build(:panel, serial_number: '90000a')).not_to be_valid
    end

    it 'should be unique' do
      FactoryBot.create(:panel, serial_number: '900001')
      expect(FactoryBot.build(:panel, serial_number: '900001')).not_to be_valid
    end
  end
end
