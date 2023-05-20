# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Installation, type: :model do
  it 'should be valid with valid attributes' do
    expect(FactoryBot.build(:installation)).to be_valid
    expect(FactoryBot.build(:installation, address: nil)).to_not be_valid
    expect(FactoryBot.build(:installation, number_of_panels: nil)).to_not be_valid
    expect(FactoryBot.build(:installation, start_date: nil)).to_not be_valid
  end

  it 'should have many panels' do
    installation = FactoryBot.create(:installation)
    FactoryBot.create :panel, installation: installation
    FactoryBot.create :panel, serial_number: '900002', installation: installation
    expect(installation.panels.count).to eq(2)
  end
end
