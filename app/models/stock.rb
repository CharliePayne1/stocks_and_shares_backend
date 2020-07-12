class Stock
    
    def self.get_stocks(date=nil)
        builtUrl = "http://api.marketstack.com/v1/eod?access_key=#{ENV['API_SECRET_KEY']}&symbols=MSFT,AAPL,AMZN,GOOG,GOOGL,FB,VOD,INTC,CMCSA,PEP,ADBE,CSCO,NVBA,NFLX,TSLA,COST,PYPL,AMGN,FNY,ASML"
        if date
            additionalUrl = "&date_from=#{date}T00:00:00+0000&date_to=#{date}T00:00:00+0000"  
            finalUrl = builtUrl + additionalUrl
        else finalUrl = builtUrl
        end
        response = HTTParty.get(finalUrl, headers: { 
          "Accept" => "application/json"
        })
        response
    end
end