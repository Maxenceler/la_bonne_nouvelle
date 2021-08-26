class ProjectsController < ApplicationController
  def index
    @projects = Project.where(user: current_user)
    @project = Project.new
  end

  def show
  end

  def edit
  end

  def new
  end

  def create
    @project = Project.new(params_project)
    @project.user = current_user
    if @project.save
      redirect_to project_path(@project)
    else
      render :index
    end
  end

  def params_project
    params.require(:project).permit(:address, :project_type, :estimated_price, :garden_size, :living_area, :rooms_number, :building_date, :non_living_area, :bathrooms_number, :bedrooms_number, :title, :buildable)
  end
end
