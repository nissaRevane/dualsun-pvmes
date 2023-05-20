require 'rails_helper'

RSpec.describe Installation, type: :model do
  it 'should be valid with valid attributes' do
    expect(FactoryBot.build(:installation)).to be_valid
    expect(FactoryBot.build(:installation, address: nil)).to_not be_valid
    expect(FactoryBot.build(:installation, number_of_panels: nil)).to_not be_valid
    expect(FactoryBot.build(:installation, start_date: nil)).to_not be_valid
  end
end
