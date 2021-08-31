class ProjectsController < ApplicationController

  def index
    @projects = Project.where(user: current_user)
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
    @steps = Step.all
    if @project.response_projects.last
      step_id = Question.where(name:Response.find(@project.response_projects.last.response_id).next_question_name)[0].step_id
      @ongoing_step = Step.find(step_id)
    else
      @ongoing_step = Step.where(number: 1)[0]
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
     if @project = Project.update(params_project)
      redirect_to chatbot_project_path(@project)
    else
      render :edit
    end
  end

  def create
    @project = Project.new(params_project)
    @project.user = current_user
    if @project.save
      # Step.all.each do |step|
      #   StepStatus.create (step: step, project: @project)
      # end
      redirect_to project_path(@project)
    else
      render :index
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  def chatbot
    @project = Project.find(params[:id])
    @questions = Question.all
    @response_projects = ResponseProject.where(project: @project)
  end

  def params_project
    params.require(:project).permit(:address, :project_type, :estimated_price, :garden_size, :living_area, :rooms_number, :building_date, :non_living_area, :bathrooms_number, :bedrooms_number, :title, :buildable, :latitude, :longitude, :selling_price, :photos, :main_photo)
  end
end
