class PagesController < ApplicationController
  def index
    puts params
  end
  def connect 
    puts params
    render 'index'
  end
end
