class SubcategoriesController < ApplicationController
  before_action :set_subcategory, only: [:show, :edit, :update, :destroy]

  def index
    @category = Category.find params[:category_id]
    @subcategories = @category.subcategories
  end

  def show
    redirect_to religion_category_subcategory_products_path religion_id: @subcategory.category.religion.id, category_id: @subcategory.category.id, subcategory_id: @subcategory.id
  end

  def new
    @category = Category.find params[:category_id]
    @subcategory = @category.subcategories.build
  end

  def edit
    @category = Category.find params[:category_id]
  end

  def create
    @category = Category.find params[:category_id]
    @subcategory = @category.subcategories.create(subcategory_params)

    respond_to do |format|
      if @subcategory.save
        format.html { redirect_to religion_category_subcategories_path(religion_id: @subcategory.category.religion.id, category_id: @subcategory.category.id), notice: 'Subcategory was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @subcategory.update(subcategory_params)
        format.html { redirect_to religion_category_subcategories_path(religion_id: @subcategory.category.religion.id, category_id: @subcategory.category.id), notice: 'Subcategory was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @subcategory.destroy

    respond_to do |format|
      format.html { redirect_to religion_category_subcategories_path(religion_id: @subcategory.category.religion.id, category_id: @subcategory.category.id), notice: 'Subcategory was successfully destroyed.' }
    end
  end

  private
  def set_subcategory
    @subcategory = Subcategory.find params[:id]
  end

  def subcategory_params
    params.require(:subcategory).permit(:title, :image)
  end
end
