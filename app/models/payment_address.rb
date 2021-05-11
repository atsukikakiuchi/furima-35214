class PaymentAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :manicipality, :house_number, :building_name, :phone_number, :payment, :item, :user, :token

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :manicipality
    validates :house_number
    validates :phone_number
    validates :payment
    validates :item
    validates :user
    validates :token
  end
  def save
    payment = Payment.create(item: item, user: user)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, manicipality: manicipality, house_number: house_number, building_name: building_name, phone_number: phone_number, payment: payment)
  end
end