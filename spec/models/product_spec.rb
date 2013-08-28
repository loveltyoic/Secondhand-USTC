require 'spec_helper'

describe Product do
  pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do
    @product = Product.new(tag:'出售')
  end

  it 'should have en_tag' do 
    @product.save
    @product.en_tag.should == 'sell'
  end

end
