class PagesController < ApplicationController
  def index
    render :json => "Welcome"
  end
end
