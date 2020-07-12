class User < ApplicationRecord
    has_many :transactions

    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }

    def calculate_transactions
        stocks = JSON.parse(Stock.get_stocks.body)
        transactions = self.transactions
        final = []
        cost = JSON.parse(transactions.to_json).map do |transaction|
            matching_stock = stocks["data"].find {|stock| stock["symbol"] == transaction["stock_symbol"]}
            s = matching_stock["close"] - transaction["cost"]
            percent = (((matching_stock["close"] - transaction["cost"]) / transaction["cost"] ) * 100)
            transaction["return_on_investment"] = s
            transaction["return_percentage"] = percent
            transaction
        end
        cost
    end

end
