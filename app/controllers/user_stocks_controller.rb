class UserStocksController < ApplicationController
  def index
    @stocks = current_user.stocks
  end

  def new
    @stock = UserStock.new
  end

  def create
    stock = Stock.find_by symbol: params[:user_stock][:symbol].downcase
    if stock.present?
      current_user.stocks << stock
      redirect_to user_stocks_path, notice: "Saved Stock"
    else
      @stock = UserStock.new
      render :new, notice: 'no such stock found.'
    end
  end

  def edit
    # @stock = UserStock.find_by(id: params[:id])
  end

  def update
    @stock = UserStock.find_by(id: params[:id])
    if @stock.update_attributes(params[:user_stock])
      redirect_to user_stocks_path, notice: "Stock Saved"
    else
      render :edit
    end
  end

  def destroy
    @stock = UserStock.find_by(id: params[:id])
    if @stock.destroy
      redirect_to user_stocks_path, notice: "Stock Deleted"
    else
      redirect_to user_stocks_path, notice: "Can't destroy stock"
    end
  end

  private

  def user_stock_params

  end


end
