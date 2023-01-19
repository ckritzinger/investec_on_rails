# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    redirect_to login_path and return unless authenticated?

    @accounts = investec.accounts
  end

  def transactions
    @transactions = investec.transactions(params[:account_id])
  end
end
