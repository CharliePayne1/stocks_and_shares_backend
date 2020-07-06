class StocksController < ApplicationController

  def index
    response = HTTParty.get("http://api.marketstack.com/v1/eod?access_key=#{ENV['API_SECRET_KEY']}&symbols=MSFT,AAPL,AMZN,GOOG,GOOGL,FB,VOD,INTC,CMCSA,PEP,ADBE,CSCO,NVBA,NFLX,TSLA,COST,PYPL,AMGN,FNY,ASML", headers: { 
      "Accept" => "application/json"
    })
    render json: response.to_h
  end

  "/stocks/:id"

  def show
    stock_symbol = params[:stock_symbol]
    response = HTTParty.get("http://api.marketstack.com/v1/eod?access_key=#{ENV['API_SECRET_KEY']}&symbols=#{stock_symbol}", headers: { 
      "Accept" => "application/json"
    })
    render json: response.body
  end

end
