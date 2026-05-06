require 'alphavantage'

Alphavantage.configure do |config|
  config.api_key = ENV.fetch('ALPHAVANTAGE_API_KEY', '')
end