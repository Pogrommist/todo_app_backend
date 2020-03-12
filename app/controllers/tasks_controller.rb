class TasksController < ApplicationController
  before_action :set_task, only: [:update, :destroy]

  def index
    render json: Task.all
  end

  def create
    task = Task.create(name: params[:name])
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
