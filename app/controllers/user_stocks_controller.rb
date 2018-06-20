class UserStocksController < ApplicationController
  def index
    @stocks = current_user.user_stocks
  end

  def show
    @user_stock = UserStock.find_by_id(params[:id])
    if @user_stock.present?
      @stock = @user_stock.stock
    else
      redirect_to root_path
    end
  end


  def new
    @stock = Stock.find_by(id: params[:id])
    if @stock.present?
      @user_stock = UserStock.new
    else
      redirect_to root_path
    end
  end

  def create
    @user_stock = UserStock.new(user_stock_params)
    if @user_stock.save
       redirect_to user_stock_path(@user_stock)
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
    @stock = UserStock.find_by(stock_id: params[:id])
    if @stock.destroy
      redirect_to user_stocks_path, notice: "Stopped Tracking"
    else
      redirect_to user_stocks_path, notice: "Something Went Wrong"
    end
  end

  def stock_list
    @stocks = current_user.user_stocks
    render 'stock_update.js.erb'
  end



  private

  def user_stock_params
    params.require(:user_stock).permit(:stock_id, :user_id)
  end


end
