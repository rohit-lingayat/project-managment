class TodosController < ApplicationController
  load_and_authorize_resource
  before_action :set_todo, only: [:edit, :update, :destroy]

  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html do
          redirect_to root_path, notice: 'todo was successfully updated.'
        end
      else
        format.html { render :edit }
      end
    end
  end

  protected

  def set_todo
    @todo = Todo.find_by(id: params[:id])
  end

  def todo_params
    params.require(:todo).permit(:status)
  end
end
