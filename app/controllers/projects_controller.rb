class ProjectsController < ApplicationController
  load_and_authorize_resource
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  after_action :assign_users

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/new
  def new
    @project = Project.new
    @project_users = @project.users.build
  end

  # GET /projects/1/edit
  def edit
    @project_users = @project.users.build
  end

  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        format.html do
          redirect_to @project,
                      notice: 'Project was successfully created.'
        end
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json do
          render json: @project.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html do
          redirect_to @project, notice: 'Project was successfully updated.'
        end
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html do
        redirect_to projects_url, notice: 'Project was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  def assign_users
    return unless params[:project] && params[:project][:users]
    params[:project][:users].each do |user|
      @project.users.destroy_all
      @project.users << User.find_by(id: user)
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name,
                                    todos_attributes:
                                      [:id, :task, :status, :user_id, :_destroy])
  end
end
