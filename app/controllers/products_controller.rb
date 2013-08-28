class ProductsController < ApplicationController
  def index
    @products = Product.all.desc(:created_at).page params[:page]
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes(product_params)
    redirect_to product_url(@product)
  end

  def create
    @product = Product.new(product_params)
    @product.picture = [] 
    params[:product][:picture].each do |key,value|
      @product.picture << value
    end
    if @product.save
      flash[:notice] = "创建成功"
      redirect_to product_url(@product)
    else
      render 'new'
    end
  end


  def show
    @product = Product.includes(:comments).find(params[:id])
  end
  
  def search_by_title_keyword
    @products = Product.where(:title => /#{params[:keyword]}/).page params[:page]
    render 'index'
  end
  
  def sell
    @products = Product.where(:tag => '出售').desc(:created_at).page params[:page]
    session[:current_tag] = '出售'
    render 'index'
  end

  def evaluate
    @products = Product.where(tag: '估价').desc(:created_at).page params[:page]
    session[:current_tag] = '估价'
    render 'index'
  end

  def buy
    @products = Product.where(tag: '求购').desc(:created_at).page params[:page]
    session[:current_tag] = '求购'
    render 'index'
  end

  # ['sell','evaluate','buy'].each do |tag|
  #   define_method(tag) do
  #     @products = Product.where(tag: "#{tag}").page params[:page]
  #     session[:current_tag] = tag
  #     render 'index'
  #   end
  # end
  def product_params
    params.require(:product).permit(:title, :url, :tag, :picture, :description)
  end

  def newest
    @products = Product.desc(:created_at).limit(20)
  end

end
