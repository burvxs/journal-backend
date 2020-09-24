class CategoriesController < ApplicationController
  before_action :authenticate_user
  def index
    user_categories = Category.where(:user_id => current_user.id).order("created_at DESC")
    render :json => {
      user_categories: user_categories
    }
  end

  def user_sub_lists
    sub_list = Category.find_by(:user_id => current_user.id).sub_list
    associated_tasks = Task.where sub_list_id: sub_list.ids
    render :json => {
      sub_list: sub_list,
      list_tasks: associated_tasks
    }
  end

  def create
    created_category = Category.create(
      :user_id => current_user.id,
      :title => params[:title]
    )

    render json: created_category
  end

  def lists
  end
  
end
