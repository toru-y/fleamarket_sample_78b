FactoryBot.define do
  factory :item do
    name                    {"ニット"}
    description             {"使用済みですが、綺麗な冬物のニットです。"}
    category_id             {"1"}
    brand                   {"シャネル"}
    size_id                 {"4"}
    condition_id            {"3"}
    shipping_fee_id         {"1"}
    prefecture_id           {"13"}
    handling_time_id        {"1"}
    price                   {"300"}
    status                  {"1"}
    trait :with_image do
      image
    end
  end
end