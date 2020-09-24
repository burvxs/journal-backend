class SubListsController < ApplicationController
  before_action :authenticate_user
  
  def create
    created_sub_list = SubList.create(
      :title => params[:title],
      :category_id => params[:category_id]
    )

    render :json => created_sub_list
  end
end
