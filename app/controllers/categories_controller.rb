class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @religion = Religion.find params[:religion_id]
    @categories = @religion.categories
  end

  def show
    redirect_to religion_category_subcategories_path religion_id: @category.religion.id, category_id: @category.id
  end

  def new
    @religion = Religion.find params[:religion_id]
    @category = @religion.categories.build
  end

  def edit
    @religion = Religion.find params[:religion_id]
  end

  def create
    @religion = Religion.find params[:religion_id]
    @category = @religion.categories.create(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to religion_categories_path(religion_id: @religion.id), notice: 'Category was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to religion_categories_path(religion_id: @category.religion.id), notice: 'Category was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to religion_categories_path(religion_id: @category.religion.id), notice: 'Category was successfully destroyed.' }
    end
  end

  private
  def set_category
    @category = Category.find params[:id]
  end

  def category_params
    params.require(:category).permit(:title, :image)
  end
end
