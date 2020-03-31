require 'net/http'

class SubmisionController < ApplicationController
  def new; end

  def create
    email = params[:email].is_a?(Array) ? params[:email].first : params[:email]
    if email.present?
      make_request(email: email)
      flash[:result] = 'Request has been sent'
    end
    redirect_to submision_new_path
  end

  private
  def make_request(params)
    url = URI.parse('https://www.corezoid.com/api/1/json/public/239191/74caa25cacbea9eaaac207981c00278cae258373')

    request = Net::HTTP::Post.new(url.path, 'Content-Type' => 'application/json')
    request.body = params.to_json

    connection = Net::HTTP.new(url.host, url.port)
    connection.use_ssl = true

    connection.request(request)
  end
end
