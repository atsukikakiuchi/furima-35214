class PaymentAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :manicipality, :house_number, :building_name, :phone_number, :item_id, :user_id, :token, :payment_id


  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :manicipality
    validates :house_number
    validates :phone_number
    validates :item_id
    validates :user_id
    validates :token
  end
  def save
    payment = Payment.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, manicipality: manicipality, house_number: house_number, building_name: building_name, phone_number: phone_number, payment_id: payment.id)
  end
end