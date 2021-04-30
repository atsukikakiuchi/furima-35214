class Item < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :charge, :prefecture, :estimated_shopping_date

  with_options presence: true do
    validates :name
    validates :text
    validates :price
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
