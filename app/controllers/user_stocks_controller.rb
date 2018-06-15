class UserStocksController < ApplicationController
  def index
    @stocks = UserStock.all
  end

  def new
    @stock = UserStock.new
  end

  def create
    byebug
    @stock = UserStock.new(user_stock_params)
    if @stock.save
      redirect_to user_stocks_path, notice: "Saved Stock"
    else
      render :new
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
  params.require(:user_stock).permit(:symbol)
end


end
