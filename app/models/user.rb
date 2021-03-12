class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  with_options presence: true do
    validates :nickname
    with_options format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i} do
      validates :password
      validates :password_confirmation
    end
    with_options format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/} do
      validates :first_name
      validates :last_name
    end
    with_options format: {with: /\A[ァ-ヶー－]+\z/ } do
      validates :first_name_ruby
      validates :last_name_ruby
    end
    validates :birthday
  end


end
