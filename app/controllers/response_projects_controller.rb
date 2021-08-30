class ResponseProjectsController < ApplicationController
  def create
    @response_project = ResponseProject.create(response_id: params[:responseId], project_id: params[:projectId])
  end
end
