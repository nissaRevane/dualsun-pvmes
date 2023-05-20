FactoryBot.define do
  factory :installation do
    address
    start_date { DateTime.new(2023, 05, 17) }
    number_of_panels { 9 }
  end
end
