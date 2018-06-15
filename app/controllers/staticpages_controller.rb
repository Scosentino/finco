class StaticpagesController < ApplicationController
  def home
    
      if params[:id] == ""
        @nothing = "Enter a Valid Symbol"
      elsif
        if params[:id]
          begin
            @stock = StockQuote::Stock.quote(params[:id])
          rescue
            @error = "Check your search and try again."
          end
        end
      end

  end

  def about
  end

  def contact
  end


end
