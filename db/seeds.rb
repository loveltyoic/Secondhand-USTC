# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
50.times do |n|
  Product.create(
    title:    "小米2/2S原装电池",
    tag:      "出售",
    description:  '自己已经有两块原电了，转让订单，但是订单不满100需要10块钱邮费.明天10点失效。需要的站内联系。',
    picture: ['http://bbs.ustc.edu.cn/cgi/sf?s=9ad67e37&bn=SecondHand&fn=M521C0395&an=2013-08-25+08.21.20_%B8%B1%B1%BE.jpg','http://bbs.ustc.edu.cn/cgi/sf?s=9ad67e37&bn=SecondHand&fn=M521C2020&an=IMG_20130827_113936.jpg'],
    url: 'http://www.fluidcars.com')
end

Product.all.each do |product|
  5.times do 
    product.comments.create!(
      content: '价格不错，顶',
      flag: '赞')
  end
end

  