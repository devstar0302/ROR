class ReligionsController < ApplicationController
  before_action :set_religion, only: [:show, :edit, :update, :destroy]

  def index
    @religions = Religion.all
  end

  def show
    redirect_to religion_categories_path religion_id: @religion.id
  end

  def new
    @religion = Religion.new
  end

  def edit
  end

  def create
    @religion = Religion.new(religion_params)

    respond_to do |format|
      if @religion.save
        format.html { redirect_to religions_url, notice: 'Religion was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @religion.update(religion_params)
        format.html { redirect_to religions_url, notice: 'Religion was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @religion.destroy
    respond_to do |format|
      format.html { redirect_to religions_url, notice: 'Religion was successfully destroyed.' }
    end
  end

  private
  def set_religion
    @religion = Religion.find(params[:id])
  end

  def religion_params
    params.require(:religion).permit(:title, :image)
  end
end
