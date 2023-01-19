# frozen_string_literal: true

class PaymentsController < ApplicationController
  def new
    beneficiaries = investec.beneficiaries
    @accounts = investec.accounts
    @beneficiary = beneficiaries.find { |b| b['beneficiaryId'] == params[:beneficiary_id] }
  end

  def create
    payments = [
      {
        'beneficiaryId' => params[:beneficiary_id],
        'amount' => params[:amount],
        'myReference' => params[:my_reference],
        'theirReference' => params[:their_reference]

      }
    ]
    begin
      investec.paymultiple(params[:account_id], payments)
      redirect_to beneficiaries_path, notice: 'Payment Successful'
    rescue StandardError => e
      redirect_to beneficiaries_path, notice: 'Payment Failed'
    end
  end
end
