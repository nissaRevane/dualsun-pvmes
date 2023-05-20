require 'rails_helper'

RSpec.describe PvmesForm, type: :model do
  it 'should be valid with valid attributes' do
    expect(FactoryBot.build(:pvmes_form)).to be_valid
    expect(FactoryBot.build(:pvmes_form, company: nil)).to_not be_valid
    expect(FactoryBot.build(:pvmes_form, customer: nil)).to_not be_valid
    expect(FactoryBot.build(:pvmes_form, installation: nil)).to_not be_valid
  end

  it 'should be unique with company, customer and installation' do
    pvmes_form = FactoryBot.create(:pvmes_form)
    expect(
      FactoryBot.build(
        :pvmes_form, company: pvmes_form.company,
        customer: pvmes_form.customer,
        installation: pvmes_form.installation
      )
    ).to_not be_valid
  end
end
