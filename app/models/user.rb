class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

         with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
          validates :family_name 
          validates :first_name
          validates :family_name_kana
          validates :first_name_kana
        end
        
        validates :nickname, presence: true
        validates :birthday, presence: true
        
        validates_format_of :password, with: PASSWORD_REGEX

        

        
        
end
