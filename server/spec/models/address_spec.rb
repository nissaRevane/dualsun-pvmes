# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do
  it 'should be valid with valid attributes' do
    expect(FactoryBot.build(:address)).to be_valid
    expect(FactoryBot.build(:address, number: nil)).to_not be_valid
    expect(FactoryBot.build(:address, street: nil)).to_not be_valid
    expect(FactoryBot.build(:address, zip_code: nil)).to_not be_valid
    expect(FactoryBot.build(:address, city: nil)).to_not be_valid
    expect(FactoryBot.build(:address, country: nil)).to_not be_valid
  end

  it 'should be invalid with invalid zip_code' do
    expect(FactoryBot.build(:address, zip_code: '34000')).to be_valid
    expect(FactoryBot.build(:address, zip_code: '5930')).to_not be_valid
    expect(FactoryBot.build(:address, zip_code: '593000')).to_not be_valid
    expect(FactoryBot.build(:address, zip_code: '59300a')).to_not be_valid
  end
end
