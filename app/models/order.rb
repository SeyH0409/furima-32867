class Order < ApplicationRecord
  has_one    :address
  belongs_to :user
  belongs_to :product
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
