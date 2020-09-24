class TasksController < ApplicationController
  before_action :authenticate_user
  def index
    if current_user
      if params[:task_type]
       switch_task_set
      else
        # If no specific task set is requested then render all 
        # user tasks.
        render :json => {
          user_tasks: current_user.tasks
        }
      end
    else
      render :json => {
        :response => "Not authorised"
      }
    end
  end

  def create
    if current_user
      created_task = Task.create!(
        user_id: current_user.id,
        task: params[:task],
        priority_level: params[:priorityLevel],
        sub_list_id: params[:subListId],
        global: params[:global],
        solidifier: params[:solidifier]
      )
      render :json => created_task
    else
      render :json => {
        response: "Not authorised"
      }
    end
  end

  def update
    is_complete_boolean = JSON.parse(params[:is_complete])
    Task.find(params[:id]).update(completed: is_complete_boolean)
  end

  private
  def switch_task_set
    current_task_set = nil
    puts "CATEGORY_ID = #{params}"
    case params[:task_type]
    when "D2D" then current_task_set = Task.where(
      :category_id => nil, 
      :sub_list_id => nil,
      :global => false,
      :user_id => current_user.id,
      :created_at => Time.now.beginning_of_day..Time.now.end_of_day
    ).order("created_at DESC")
    when "CATEGORISED" then current_task_set = Task.where(
      :user_id => current_user.id,
      :sub_list_id => params[:list_id]
    ).order("created_at DESC") if params[:list_id].present?
    when "FLOATERS" then current_task_set = Task.where(
      :user_id => current_user.id,
      :global => true
    )
    end
    render :json => {
      requested_task_set: current_task_set
    }
  end
end
