FactoryBot.define do
  factory :order_shipping do
    postal_code       {'110-0015'}
    prefecture_id     {'7'}
    city              {'京都市'}
    address           {'北区上賀茂59-12'}
    apartment         {'リーフガーデン'}
    phone_number      {'0757220717'}
    token             {"tok_abcdefghijk00000000000000000"}
  end
end