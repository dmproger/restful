FactoryBot.define do
  factory :server do
    transient do
      bandwiths_count { 2 }
    end

    name { 'Server ' + Faker::Name.name  }
    bandwiths do
      Array.new(bandwiths_count) do
        association(:bandwith, server: instance)
      end
    end
  end
end
