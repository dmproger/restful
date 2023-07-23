FactoryBot.define do
  factory :bandwith do
    server { association :server }

    interface_name { 'Interface ' + Faker::Name.unique.name  }
    Value { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
    value_id { build(:serial) }
  end
end
