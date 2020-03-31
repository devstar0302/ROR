class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @subcategory = Subcategory.find params[:subcategory_id]
    @products = @subcategory.products
  end

  def new
    @subcategory = Subcategory.find params[:subcategory_id]
    @product = @subcategory.products.build
  end

  def edit
    @subcategory = Subcategory.find params[:subcategory_id]
  end

  def create
    @subcategory = Subcategory.find params[:subcategory_id]
    @product = @subcategory.products.create(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to religion_category_subcategory_products_path(religion_id: @product.subcategory.category.religion.id, category_id: @product.subcategory.category.id, subcategory_id: @product.subcategory.id), notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to religion_category_subcategory_products_path(religion_id: @product.subcategory.category.religion.id, category_id: @product.subcategory.category.id, subcategory_id: @product.subcategory.id), notice: 'Product was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to religion_category_subcategory_products_path(religion_id: @product.subcategory.category.religion.id, category_id: @product.subcategory.category.id, subcategory_id: @product.subcategory.id), notice: 'Product was successfully destroyed.' }
    end
  end

  private
  def set_product
    @product = Product.find params[:id]
  end

  def product_params
    params.require(:product).permit(:model, :price, :stone, :image)
  end
end
