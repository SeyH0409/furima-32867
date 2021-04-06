class OrderAddress
  include ActiveModel::Model
  attr_accessor :prefecture_id, :postcode, :city, :block, :building, :phone_number, 
                :user_id, :product_id, 
                :token
  
  with_options presence: true do
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city 
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :user_id
    validates :product_id
  end

  def save
    order = Order.create(product_id: product_id, user_id: user_id)
    Address.create(postcode: postcode, city: city, block: block, 
                   phone_number: phone_number, prefecture_id: prefecture_id, order_id: order.id )
  end
end