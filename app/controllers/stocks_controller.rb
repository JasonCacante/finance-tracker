class StocksController < ApplicationController
  before_action :check_param_stock

  def search
    @stock = Stock.new_lookup(params[:stock])
    if @stock.present?
      respond_to do |format|
        format.js { render partial: 'users/result' }
      end
    else
      respond_to do |format|
        flash.now[:alert] = 'You have entered an incorrect symbol'
        format.js { render partial: 'users/result' }
      end
    end
  end

  private

  def check_param_stock
    return unless params[:stock].blank?

    respond_to do |format|
      flash.now[:alert] = 'Please enter a symbol to search'
      format.js { render partial: 'users/result' }
    end
  end
end
