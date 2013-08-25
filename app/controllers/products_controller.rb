class ProductsController < ApplicationController
  def index
    @products = Product.all.desc(:create_at).page params[:page]
  end
end
