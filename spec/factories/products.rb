FactoryBot.define do
  factory :product do
    name            {Faker::Games::Pokemon.name}
    description     {Faker::Quotes::Shakespeare.romeo_and_juliet_quote}
    price           {1000}
    quality_id      {2}
    category_id     {2}
    delivery_fee_id {2}
    delivery_day_id {2}
    prefecture_id   {2}
    association     :user
    
    after(:build) do |product|
      product.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
  end
end
