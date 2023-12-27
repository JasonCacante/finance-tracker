# frozen string literal: true

class WelcomeController < ApplicationController
  def index
    render plain: 'Hello, World!'
  end
end