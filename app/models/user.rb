class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  has_many :furimas
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
  validates :family_name, :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/} do
  validates :family_name_ruby, :first_name_ruby
  end
  validates :nickname, :birthday, presence: true
end
