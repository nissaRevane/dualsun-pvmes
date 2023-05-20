# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Panel, type: :model do
  it 'should be valid with valid attributes' do
    expect(FactoryBot.build(:panel)).to be_valid
    expect(FactoryBot.build(:panel, technology: nil)).to_not be_valid
    expect(FactoryBot.build(:panel, serial_number: nil)).to_not be_valid
  end

  describe 'technology' do
    it 'should be valid with valid technologies' do
      expect(FactoryBot.build(:panel, technology: 'hybrid')).to be_valid
      expect(FactoryBot.build(:panel, technology: 'photovoltaic')).to be_valid
      expect(FactoryBot.build(:panel, technology: 'road')).not_to be_valid
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
