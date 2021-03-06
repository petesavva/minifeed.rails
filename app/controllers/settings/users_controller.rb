class Settings::UsersController < ApplicationController
  before_action :ensure_user_is_admin!
  before_action :set_objects

  skip_after_action :verify_policy_scoped

  def index
    @users = scope.all
  end

  def new
    @user = scope.new(user_params)
    @user.password ||= Agilibox::TokenGenerator.call(size: 8)
  end

  def create
    new

    if @user.save
      flash.notice = t(".messages.ok")
      redirect_to back_url
    else
      render :new
    end
  end

  def show
    redirect_to action: :edit
  end

  def edit
  end

  def update
    if @user.update(user_params)
      bypass_sign_in(@user) if @user == current_user
      flash.notice = t(".messages.ok")
      redirect_to back_url
    else
      render :edit
    end
  end

  def destroy
    @user.destroy!
    flash.notice = t(".messages.ok")

    redirect_to back_url
  end

  private

  def scope
    User.all
  end

  def back_url
    url_for(action: :index, id: nil)
  end

  def set_objects
    @user = scope.find(params[:id]) if params.key?(:id)
  end

  def permitted_params
    [
      :name,
      :email,
      :password,
      :is_admin,
    ]
  end

  def user_params
    params
      .fetch(:user, {})
      .delete_if { |k, v| k.to_sym == :password && v.blank? }
      .permit(permitted_params)
  end
end
