class Item < ApplicationRecord
  
  belongs_to :user
  has_one :payment
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :estimated_shopping_date

  with_options presence: true do
    validates :name
    validates :text
    validates :price, numericality: {greater_than_or_equal_to: 300,less_than: 10000000},format:{with:/\A[0-9]+\z/}
    with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :charge_id
    validates :prefecture_id
    validates :estimated_shopping_date_id
    end
    validates :image
  end
end
