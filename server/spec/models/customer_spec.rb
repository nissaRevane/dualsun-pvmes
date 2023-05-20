require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'should be valid with valid attributes' do
    expect(FactoryBot.build(:customer)).to be_valid
    expect(FactoryBot.build(:customer, name: nil)).to_not be_valid
    expect(FactoryBot.build(:customer, email: nil)).to_not be_valid
  end

  describe 'email' do
    it 'should have have a correct format' do
      expect(FactoryBot.build(:customer, email: 'valid@email.com')).to be_valid
      expect(FactoryBot.build(:customer, email: 'invalid')).to_not be_valid
    end

    it 'should be unique' do
      customer = FactoryBot.create(:customer)
      expect(
        FactoryBot.build(:customer, email: customer.email)
      ).to_not be_valid
    end
  end

  describe 'phone_number' do
    it 'should have a correct format' do
      expect(FactoryBot.build(:customer, phone_number: '0123456789')).to be_valid
      expect(FactoryBot.build(:customer, phone_number: '012345678')).to_not be_valid
      expect(FactoryBot.build(:customer, phone_number: '01234567890')).to_not be_valid
    end
  end
end
