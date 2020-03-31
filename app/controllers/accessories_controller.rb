class AccessoriesController < ApplicationController
  before_action :set_accessory, only: [:show, :edit, :update, :destroy]

  def index
    @accessories = Accessory.all
  end

  def new
    @accessory = Accessory.new
  end

  def edit
  end

  def create
    @accessory = Accessory.new(accessory_params)

    respond_to do |format|
      if @accessory.save
        format.html { redirect_to accessories_path, notice: 'Accessory was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @accessory.update(accessory_params)
        format.html { redirect_to accessories_path, notice: 'Accessory was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /accessories/1
  # DELETE /accessories/1.json
  def destroy
    @accessory.destroy
    respond_to do |format|
      format.html { redirect_to accessories_path, notice: 'Accessory was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accessory
      @accessory = Accessory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accessory_params
      params.require(:accessory).permit(:title, :image)
    end
end
