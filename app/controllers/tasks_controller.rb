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
    task_to_update = Task.find(params[:id])
    puts "PATCHED PARAMS #{params}"
    is_complete_params = params[:is_complete]
    task_params = params[:task]
    solidifier_params = params[:solidifier]
    priority_params = params[:priority]
    unless params[:is_complete].is_a?(String)
      is_complete_params = task_to_update.completed?
    else
      is_complete_params = JSON(params[:is_complete])
    end
    unless params[:task].is_a?(String)
      task_params = task_to_update.task
    end
    unless params[:solidifier].is_a?(String)
      solidifier_params = task_to_update.solidifier
    end
    unless params[:priority].is_a?(String)
      priority_params = task_to_update.priority_level
    end

    task_to_update.update(task: task_params, solidifier: solidifier_params, :priority_level => priority_params, completed: is_complete_params)
    # if params[:is_complete].present?
    #   is_complete_boolean = JSON.parse(params[:is_complete])
    #   task_to_update.update(completed: is_complete_boolean)
    # elsif params[:task] != nil
    #   task_to_update.update(task: params[:task])
    #   render :json => {
    #     task: task_to_update.task
    #   } 
    # elsif params[:solidifier].present?
    #   task_to_update.update(solidifier: params[:solidifier])

    #   render :json => {
    #     solidifier: task_to_update.solidifier
    #   } 
    # end

    render json: task_to_update
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
