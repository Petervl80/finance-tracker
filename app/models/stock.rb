class Stock < ApplicationRecord

	def self.new_lookup(ticker_symbol)
		begin
			quote_thread    = Thread.new { Alphavantage::TimeSeries.new(symbol: ticker_symbol).quote }
			overview_thread = Thread.new { Alphavantage::Fundamental.new(symbol: ticker_symbol).overview }

			quote    = quote_thread.value
			overview = overview_thread.value

			new(ticker: overview.symbol, name: overview.name, last_price: quote.price)
		rescue => exception
			return nil
		end
	end

end
