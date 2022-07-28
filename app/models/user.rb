class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         ASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :encrypted_password, with: PASSWORD_REGEX

         with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
          validates :first_name
          validates :last_name
          validates :first_name_kana
          validates :last_name_kana
        end
        
        validates :nickname, presence: true
        validates :birthday, presence: true
        
end
