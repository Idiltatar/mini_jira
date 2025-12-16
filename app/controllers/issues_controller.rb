class IssuesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_issue, only: %i[show edit update destroy]

  def show
  end

  def new
    @issue = @project.issues.new
  end

  def create
    @issue = @project.issues.new(issue_params)

    if @issue.save
      redirect_to project_path(@project), notice: "Issue created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @issue.update(issue_params)
      redirect_to project_path(@project), notice: "Issue updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @issue.destroy
    redirect_to project_path(@project), notice: "Issue deleted successfully."
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_issue
    @issue = @project.issues.find(params[:id])
  end

  def issue_params
    params.require(:issue).permit(:title, :description, :status, :priority, :user_id)
  end
end
