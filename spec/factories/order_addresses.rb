FactoryBot.define do
  factory :order_address do
    token { "tok_abcdefghijk00000000000000000" }
    prefecture_id {2}
    postcode { '000-0000' }
    city     { '札幌市清田区' }
    block    { '平岡4条1丁目' }
    building { '河合荘' }
    phone_number { '08066365646' }
  end
end
