FactoryBot.define do
  factory :payment_address do

    postal_code          {'807-0875'}
    prefecture_id        {2}
    manicipality         {"北九州市八幡西区"}
    house_number         {"１丁目１−１"}
    building_name        {"柳ビル１０１"}
    phone_number         {"09012345678"}
    token                {"tok_abcdefghijk00000000000000000"}

    association :user
    association :item
  end
end
