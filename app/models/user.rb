class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, allow_blank: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, presence: true, format: { with: PASSWORD_REGEX, allow_blank: true }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, allow_blank: true } do
    validates :last_name
    validates :first_name
  end
  
  with_options presence: true, format: { with: /\A[ァ-ヶ一]+\z/, allow_blank: true } do
    validates :last_name_kana
    validates :first_name_kana
  end

  validates :birthday, presence: true
end