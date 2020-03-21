class CommentsController < ApplicationController
  before_action :authenticate_user!, except: %i[index]
  before_action :set_task, only: [:create]

  def create
    comment = @task.comments.create(comment: params[:comment], task_id: @task.id, user_id: current_user.id)
    render json: comment
  end

  private

  def set_task
    return unless current_user
    @task = current_user.tasks.find_by(id: params[:task_id])
  end
end