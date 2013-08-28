# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
50.times do |n|
  Product.create(
    title:    "跑车",
    tag:      "出售",
    description:  '玛莎拉蒂（Maserati）是一家意大利豪华汽车制造商，1914年12月1日成立于博洛尼亚（Bologna），公司总部现设于摩德纳（Modena），品牌的标志为一支三叉戟。1993年菲亚特（Fiat S.p.A.）收购玛莎拉蒂，但品牌得以保留。而今的玛莎拉蒂全新轿跑系列是意大利顶尖轿跑车制作技术的体现，也是意大利设计美学以及优质工匠设计思维的完美结合。',
    picture: ['car1.jpg','car4.jpg','car5.jpg'],
    url: 'http://www.fluidcars.com')
end

# Product.all.each do |product|
#   5.times do 
#     product.comments.create!(
#       content: '价格不错，顶',
#       flag: '赞')
#   end
# end

  