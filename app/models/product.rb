class Product < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :quality_id
    validates :category_id
    validates :delivery_fee_id
    validates :delivery_day_id
    validates :prefecture_id
  end

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :quality
  belongs_to :categories
  belongs_to :delivery_fee
  belongs_to :delivery_day
  belongs_to :prefecture
end
