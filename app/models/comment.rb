class Comment
  include Mongoid::Document
  belongs_to :product
 
  field :content
  field :flag


end
