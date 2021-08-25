FactoryBot.define do
  factory :buy_residence do

    postal_code          { '340-1234' }
    prefecture_id        { 2 }
    city                 { '釧路市' }
    address              { '釧路町12-1' }
    building_name        { '杉ビル' }
    phone_number         { '09012348765' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
