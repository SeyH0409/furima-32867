class Product < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :name
    validates :description, length: {maximum: 1000}
    validates :price, format: { with: /\A[0-9]+\z/ }, 
                      numericality: {greater_than: 300, less_than: 9999999}
    with_options numericality: { other_than: 1} do
      validates :quality_id
      validates :category_id
      validates :delivery_fee_id
      validates :delivery_day_id
      validates :prefecture_id
    end
  end

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :quality
  belongs_to :category
  belongs_to :delivery_fee
  belongs_to :delivery_day
  belongs_to :prefecture
  has_one    :order
end
