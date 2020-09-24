class TrackersController < ApplicationController
  before_action :authenticate_user

  def index
    created_tracker = Tracker.create!(
      :user_id => current_user.id,
      :weekly_total => stats[:weekly_total],
      :grand_total => stats[:grand_total],
      :daily_total => stats[:daily_total],
      :incomplete_weekly_total => stats[:incomplete_weekly_total],
      :incomplete_total => stats[:incomplete_total],
      :incomplete_daily_total => stats[:incomplete_daily_total]
    )
    render :json => created_tracker
  end

  private
  def stats 
    completed_grand_total = Task.where(:user_id => current_user.id, :completed => true).length
    completed_daily_total = Task.where(
      :user_id => current_user.id,
      :completed => true,
      :created_at => Time.now.beginning_of_day..Time.now.end_of_day
    ).length
    completed_weekly_total = Task.where(
      :user_id => current_user.id,
      :completed => true,
      :created_at => Time.now.beginning_of_week..Time.now.end_of_week
    ).length
    incomplete_grand_total = Task.where(:user_id => current_user.id, :completed => false).length
    incomplete_daily_total = Task.where(
      :user_id => current_user.id,
      :completed => false,
      :created_at => Time.now.beginning_of_day..Time.now.end_of_day
    ).length
    incomplete_weekly_total = Task.where(
      :user_id => current_user.id,
      :completed => false,
      :created_at => Time.now.beginning_of_week..Time.now.end_of_week
    ).length

    stats = {
      grand_total: completed_grand_total,
      daily_total: completed_daily_total,
      weekly_total: completed_weekly_total,
      incomplete_total: incomplete_grand_total,
      incomplete_weekly_total: incomplete_weekly_total,
      incomplete_daily_total: incomplete_daily_total
    }
  end 
end
