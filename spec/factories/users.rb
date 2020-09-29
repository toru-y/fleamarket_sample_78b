FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    sequence(:email) { |n| "TEST#{n}@example.com" }
    password              {"0000aaaa"}
    password_confirmation {"0000aaaa"}
    last_name             {"山田"}
    first_name            {"花子"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"ハナコ"}
    birth_date            {"2020/09/09"}
  end

end