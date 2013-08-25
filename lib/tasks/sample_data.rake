namespace :lzh do
  desc "make products"
  task fake_products: :environment do
    make_products
  end
end

def make_products
  500.times do |n|
    Product.create!(title: "第#{n}件商品", tag: "出售")
  end
end