# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    title    "小米2/2S原装电池"
    tag      "出售"
    description  '自己已经有两块原电了，转让订单，但是订单不满100需要10块钱邮费.明天10点失效。需要的站内联系。'
  end
end
