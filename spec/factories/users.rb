FactoryBot.define do
  factory :user do
    nickname {'test'}
    email {Faker::Internet.email}
    password {'1a'+Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name {'山田'}
    given_name {'太郎'}
    family_name_kana {'ヤマダ'}
    given_name_kana {'タロウ'}
    birthday {'2000/01/01'}
  end
end