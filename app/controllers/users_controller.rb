# frozen_string_literal: true

class UsersController < ApplicationController
  def my_portfolio
    @user = current_user
    @tracked_stocks = current_user.stocks
  end

  def my_friends
    @friends = current_user.friends
  end

  def search_friend
    if params[:friend].present?
      @friends = User.search(params[:friend])
      @friends = current_user.except_current_user(@friends)
      if @friends
        respond_to do |format|
          format.js { render partial: 'users/result_friend' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = 'Could not find user'
          format.js { render partial: 'users/result_friend' }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = 'Please enter a friend name or email to search'
        format.js { render partial: 'users/result_friend' }
      end
    end
  end

  def show
    @user = User.find(params[:id])
    @tracked_stocks = @user.stocks
  end
end
