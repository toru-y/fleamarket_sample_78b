class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :nickname, presence: true, uniqueness: true
  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date, presence: true  
  validates :password, presence: true, length: { minimum: 7 }, format: { with: /(?=.*\d+.*)(?=.*[a-zA-Z]+.*)./ }


  has_many :purchases
  has_many :items
  has_many :comments
  has_one :credit_card
end
