class LoginController < ApplicationController
  def index
  end

  def logout
    cookies.delete(:username)
    cookies.delete(:password)
    cookies.delete(:api_key)
    redirect_to login_path
  end

  def auth

    begin
      Api.new(params[:client_id],params[:secret],params[:api_key]).authenticate!
    rescue => exception
      render :index and return
    end

    cookies[:username] = params[:client_id]
    cookies[:password] = params[:secret]
    cookies[:api_key] = params[:api_key]

    redirect_to root_path
  end
end
