class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  validates :name, :ticker, presence: true
  before_save { self.ticker = ticker.upcase }

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.dig(:iex, :token),
      secret_token: Rails.application.credentials.dig(:iex, :secret),
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    begin
      new(ticker: ticker_symbol,
          name: client.company(ticker_symbol).company_name,
          last_price: client.price(ticker_symbol))
    rescue StandardError => e
      nil
    end
  end

  def self.update_prices(user)
    stocks = user.stocks
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.dig(:iex, :token),
      secret_token: Rails.application.credentials.dig(:iex, :secret),
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    stocks.each { |stock| stock.update_attribute(:last_price, client.price(stock.ticker)) }
  end

  def self.check_db(ticker_symbol)
    where(ticker: ticker_symbol).first
  end
end
