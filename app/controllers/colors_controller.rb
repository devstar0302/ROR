class ColorsController < ApplicationController
  before_action :set_color, only: [:show, :edit, :update, :destroy]

  def index
    @colors = Color.all
  end

  def new
    @color = Color.new
  end

  def edit
  end

  def create
    @color = Color.new(color_params)

    respond_to do |format|
      if @color.save
        format.html { redirect_to colors_path, notice: 'Color was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @color.update(color_params)
        format.html { redirect_to colors_path, notice: 'Color was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @color.destroy
    respond_to do |format|
      format.html { redirect_to colors_path, notice: 'Color was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_color
      @color = Color.find(params[:id])
    end

    def color_params
      params.require(:color).permit(:title, :image)
    end
end
