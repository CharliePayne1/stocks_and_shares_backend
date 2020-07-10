class StocksController < ApplicationController

  def index
    builtUrl = "http://api.marketstack.com/v1/eod?access_key=#{ENV['API_SECRET_KEY']}&symbols=MSFT,AAPL,AMZN,GOOG,GOOGL,FB,VOD,INTC,CMCSA,PEP,ADBE,CSCO,NVBA,NFLX,TSLA,COST,PYPL,AMGN,FNY,ASML"
    if params[:date]
      additionalUrl = "&date_from=#{params[:date]}T00:00:00+0000&date_to=#{params[:date]}T00:00:00+0000"  
        finalUrl = builtUrl + additionalUrl
    else finalUrl = builtUrl

      end
    response = HTTParty.get(finalUrl, headers: { 
      "Accept" => "application/json"
    })
    second_response = HTTParty.get("https://api.nytimes.com/svc/topstories/v2/business.json?api-key=#{ENV['NEWS_API_KEY']}", headers: { 
      "Accept" => "application/json"
    })
    render json: {response: response, news: second_response}
  end

  def show
    stock_symbol = params[:stock_symbol]
    response = HTTParty.get("http://api.marketstack.com/v1/eod?access_key=#{ENV['API_SECRET_KEY']}&symbols=#{stock_symbol}", headers: { 
      "Accept" => "application/json"
    })
    render json: response.body
  end

  private

  def stock_params
  params.require(:stock).permit(:date)
  end

end
