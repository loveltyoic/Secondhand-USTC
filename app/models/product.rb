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
  field :en_tag

  before_save :mark_tag

  def mark_tag #将汉字标记转化为英文标记，用于样式
    if self.tag == '出售'
      self.en_tag = 'sell'
    elsif self.tag == '求购'
      self.en_tag = 'buy'
    else
      self.en_tag = 'evaluate'
    end
  end
end
