class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:update, :destroy]

  def index
    return unless current_user
    if current_user.isAdmin
      render json: Task.all, each_serializer: TaskSerializer
    else
      render json: current_user.tasks, each_serializer: TaskSerializer
    end
  end

  def create
    user = User.find_by(email: params[:email])
    return unless user
    task = user.tasks.create(name: params[:name])
    render json: task
  end

  def update
    task = Task.find_by(id: params[:id])
    return unless task
    task.update_attributes(name: params[:name], completed: params[:completed])
    task.save!

    render json: task
  end

  def destroy
    @task.destroy
    render json: @task
  end

  private

  def set_task
    @task = Task.find_by(id: params[:id])
  end

end
