class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :shipping_area
  belongs_to :shipping_day


  with_options presence: true do
    validates :image
    validates :name
    validates :information
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :shipping_area_id
    validates :shipping_day_id
    validates :price
  end

  with_options numericality: { other_than:1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :shipping_area_id
    validates :shipping_day_id
  end

  

end
