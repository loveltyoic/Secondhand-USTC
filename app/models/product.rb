class Product
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :onwer, class_name: 'User'
  has_many :comments

  field :price, type: Integer
  field :tag
  field :picture, type: Array
  field :title
  field :description
  field :url
end
