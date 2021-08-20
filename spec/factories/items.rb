FactoryBot.define do
  factory :item do
    association :user

    product_name          { '商品名' }
    description           { '商品の説明' }
    category_id           { 2 }
    status_id             { 2 }
    postage_id            { 2 }
    prefecture_id         { 2 }
    day_delivery_id       { 2 }
    price                 { 2222 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
