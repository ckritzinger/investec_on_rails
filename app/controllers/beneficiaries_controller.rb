# frozen_string_literal: true

class BeneficiariesController < ApplicationController
  def index
    @beneficiaries = investec.beneficiaries
  end
end
