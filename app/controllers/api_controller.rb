class ApiController < ApplicationController
  skip_before_action :authenticate_user!

  def religions
    @religions = Religion.all
  end

  def colors
    @colors = Color.all
  end

  def accessories
    @accessories = Accessory.all
  end
end
