FactoryBot.define do
  factory :item do
    name               {'アイウエオ'}
    text               {'使いやすい'}
    price              {10000}
    category_id        {2}
    status_id          {2}
    shipping_charge_id {2}
    shipping_date_id   {2}
    prefecture_id      {2}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end
