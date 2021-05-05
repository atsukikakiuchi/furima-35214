FactoryBot.define do
  factory :item do
    name                       {Faker::Team.name}
    text                       {Faker::Lorem.sentence}
    category_id                {2}
    condition_id               {2}
    charge_id                  {2}
    prefecture_id              {2}
    estimated_shopping_date_id {2}
    price                      {"300"}
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user 
  end
end
