# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: [:assign_role]

  def index
    @users = User.page(params[:page]).per(10)
  end

  def assign_role
    return unless params[:user].present?
    @user.add_role(
      params[:user][:roles].reject!(&:empty?)
    )
    redirect_to users_path
  end

  protected

  def find_user
    @user = User.find_by(id: params[:id])
  end
end
