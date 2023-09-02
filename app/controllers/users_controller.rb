class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?

  def index
    @users = User.where.not(:id => current_user.id)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    password_setting(@user)
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'Successfully created User.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

      # TODO Enviar mail con password
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?

    if @user.update(user_params)
      flash[:notice] = "Successfully updated User."
      redirect_to root_path
    else
      respond_to do |format|
        format.html { redirect_to new_user_path, alert: @user.errors.full_messages }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :last_name,
      :rut,
      :email,
      contact_info: %i[phone_1 phone_2 email_1 email_2],
      address: %i[street_address comune_id province_id region_id zip]
    )
  end

  def password_setting(user)
    generated_password = Devise.friendly_token.first(8)

    user.password = generated_password
    user.password_confirmation = generated_password
    generated_password
  end

  def is_admin?
    unless current_user.admin?
      respond_to do |format|
        format.html { redirect_to root_path, alert: "Only admins can access" }
      end
    end
  end
end