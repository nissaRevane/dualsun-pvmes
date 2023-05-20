require 'rails_helper'

RSpec.describe PvmesForm, type: :model do
  it 'should be valid with valid attributes' do
    expect(FactoryBot.build(:pvmes_form)).to be_valid
    expect(FactoryBot.build(:pvmes_form, company: nil)).to_not be_valid
    expect(FactoryBot.build(:pvmes_form, customer: nil)).to_not be_valid
    expect(FactoryBot.build(:pvmes_form, installation: nil)).to_not be_valid
  end
end
