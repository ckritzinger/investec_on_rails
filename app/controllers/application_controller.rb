class ApplicationController < ActionController::Base
  def authenticated?
    username.present? && password.present? && api_key.present?
  end

  def investec
    @investec ||= Api.new(username,password,api_key).authenticate!
  end

  def username
    cookies[:username]
  end

  def password
    cookies[:password]
  end

  def api_key
    cookies[:api_key]
  end
end