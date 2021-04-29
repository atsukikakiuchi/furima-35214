class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  with_options format: {with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
  validates :last_name, presence: true
  validates :first_name, presence: true
  end
  with_options format: { with: /\A[ァ-ヶー－]+\z/} do
  validates :last_name_katakana, presence: true
  validates :first_name_katakana, presence: true
  end
  validates :birthday, presence: true

  has_many :items
  has_many :payments

end