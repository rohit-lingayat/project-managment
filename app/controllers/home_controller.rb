# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @all_projects = Project.page(params[:page]).per(10)
    @all_todos = current_user.todos.page(params[:page]).per(10)
  end
end
