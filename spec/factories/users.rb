FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '真島' }
    last_name             { '吾郎' }
    first_name_kana       { 'マジマ' }
    last_name_kana        { 'ゴロウ' }
    birthday              { Faker::Date.between(from: '1989-01-01', to: '2016-12-31') }
  end
end
