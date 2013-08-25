class Product
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :onwer, class_name: 'User'

  field :price, type: Integer
  field :tag
  field :picture
  field :title
  field :description
end
