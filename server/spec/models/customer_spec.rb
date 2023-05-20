require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'should be valid with valid attributes' do
    expect(FactoryBot.build(:customer)).to be_valid
    expect(FactoryBot.build(:customer, name: nil)).to_not be_valid
    expect(FactoryBot.build(:customer, email: nil)).to_not be_valid
  end

  it 'should have a valid email' do
    expect(FactoryBot.build(:customer, email: 'valid@email.com')).to be_valid
    expect(FactoryBot.build(:customer, email: 'invalid')).to_not be_valid
  end

  it 'should have a valid phone number' do
    expect(FactoryBot.build(:customer, phone_number: '0123456789')).to be_valid
    expect(FactoryBot.build(:customer, phone_number: '012345678')).to_not be_valid
    expect(FactoryBot.build(:customer, phone_number: '01234567890')).to_not be_valid
  end
end
