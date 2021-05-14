class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
  validates :nickname
  with_options format: {with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ } do
  validates :last_name
  validates :first_name
  end
  with_options format: { with: /\A[ァ-ヶー－]+\z/} do
  validates :last_name_katakana
  validates :first_name_katakana
  end
  validates :birthday
  validates :password,:password_confirmation,format:{with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  end

   has_many :items
   has_many :payments

end