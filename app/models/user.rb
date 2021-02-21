class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, presence: true, format: {with: /\A[a-zA-Z0-9]+\z/}
  validates :password_confirmation, presence: true, format: {with: /\A[a-zA-Z0-9]+\z/}
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_ruby, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_ruby, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true


end
