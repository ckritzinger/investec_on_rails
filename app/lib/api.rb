# frozen_string_literal: true

class Api
  API_URL = 'https://openapi.investec.com/'

  attr_reader :token

  def initialize(username, password, api_key)
    @username = username
    @password = password
    @api_key = api_key
  end

  def authenticate!
    @token = get_oauth_token['access_token']
    self
  end

  # {
  #   "accountId": "172878438321553632224",
  #   "accountNumber": "10010206147",
  #   "accountName": "Mr John Doe",
  #   "referenceName": "My Investec Private Bank Account",
  #   "productName": "Private Bank Account",
  #   "kycCompliant": true,
  #   "profileId": "10163189587443"
  #   }
  def accounts
    response = connection.get('za/pb/v1/accounts')
    response.body['data']['accounts']
  end

  # {
  # "accountId": "172878438321553632224",
  # "currentBalance": 28857.76,
  # "availableBalance": 98857.76,
  # "currency": "ZAR"
  # }
  def balance(account_id)
    response = connection.get("/za/pb/v1/accounts/#{account_id}/balance")
    response.body['data']
  end

  # {
  # "accountId": "172878438321553632224",
  # "type": "DEBIT",
  # "transactionType": "FeesAndInterest",
  # "status": "POSTED",
  # "description": "MONTHLY SERVICE CHARGE",
  # "cardNumber": "",
  # "postedOrder": 13379,
  # "postingDate": "2020-06-11",
  # "valueDate": "2020-06-10",
  # "actionDate": "2020-11-10",
  # "transactionDate": "2020-06-10",
  # "amount": 535,
  # "runningBalance": 28857.76
  # }
  def transactions(account_id)
    response = connection.get("za/pb/v1/accounts/#{account_id}/transactions")
    response.body['data']['transactions']
  end

  # {
  #   "BeneficiaryId": "MTAxOTAxOTyNTQMTU=",
  #   "AccountNumber": "6241708900",
  #   "Code": "250655",
  #   "Bank": "FIRST NATIONAL BANK",
  #   "BeneficiaryName": "Ad A AIA",
  #   "LastPaymentAmount": "10.00",
  #   "LastPaymentDate": "11/05/2022",
  #   "CellNo": null,
  #   "EmailAddress": "QUwCV@someweb.co.za",
  #   "Name": "DccIcIXI",
  #   "ReferenceAccountNumber": "NIC036",
  #   "ReferenceName": "amingFra ing Framin",
  #   "CategoryId": "10164601247279",
  #   "profileId": "10163189587443"
  #   }
  def beneficiaries
    response = connection.get('za/pb/v1/accounts/beneficiaries')
    response.body['data']
  end

  # {
  #   "id": "10164601247279",
  #   "isDefault": "true",
  #   "name": "Not Categorised"
  #   }
  def beneficiary_categories
    response = connection.get('za/pb/v1/accounts/beneficiarycategories')
    response.body['data']
  end

  # [
  #   {
  #     'beneficiaryId': 'YYYYYYYYYY',
  #     'amount': '10',
  #     'myReference': 'API transfer',
  #     'theirReference': 'API transfer'
  #   }
  # ]
  def paymultiple(account_id, payment_list)
    response = connection.post("/za/pb/v1/accounts/#{account_id}/paymultiple", {
                                 paymentList: payment_list
                               })
    response.body['data']
  end

  private

  def get_oauth_token
    auth_connection = Faraday.new(url: API_URL) do |builder|
      builder.headers['Accept'] = 'application/json'
      builder.headers['x-api-key'] = @api_key
      builder.basic_auth(@username, @password)
      builder.response :logger
      builder.response :raise_error
      builder.response :json
      builder.adapter Faraday.default_adapter
    end

    response = auth_connection.post('identity/v2/oauth2/token', {
      grant_type: 'client_credentials',
      scope: 'accounts'
    }.to_query)

    response.body
  end

  def connection
    @_connection ||= Faraday.new(url: API_URL) do |builder|
      builder.headers['Authorization'] = "Bearer #{@token}" if @token

      builder.headers['Accept'] = 'application/json'
      builder.request :json
      builder.response :logger
      builder.response :raise_error
      builder.response :json

      builder.adapter Faraday.default_adapter
    end
  end
end
