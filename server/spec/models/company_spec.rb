# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company, type: :model do
  it 'should be valid with valid attributes' do
    expect(FactoryBot.build(:company)).to be_valid
    expect(FactoryBot.build(:company, name: nil)).to_not be_valid
    expect(FactoryBot.build(:company, immatriculation: nil)).to_not be_valid
  end

  describe 'immatriculation' do
    it 'should be a 9 digit code' do
      expect(FactoryBot.build(:company, immatriculation: '012345678')).to be_valid
      expect(FactoryBot.build(:company, immatriculation: '01234567')).to_not be_valid
      expect(FactoryBot.build(:company, immatriculation: '0123456789')).to_not be_valid
    end

    it 'should be unique' do
      company = FactoryBot.create(:company)
      expect(
        FactoryBot.build(:company, immatriculation: company.immatriculation)
      ).to_not be_valid
    end
  end
end
