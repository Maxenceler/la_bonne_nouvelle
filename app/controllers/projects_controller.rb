class ProjectsController < ApplicationController
  def index
    @projects = Project.where(user: current_user)
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
  end

  def new
  end
end
