class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    Rails.logger.debug("My object: ")
    render :text => 'params'
    # render task_params
  end
end
