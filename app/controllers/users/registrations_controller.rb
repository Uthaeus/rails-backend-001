# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :authenticate_user!, except: [:create]
  respond_to :json

  # GET /resource/edit
  # def edit
  #   super
  # end

  protected 

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :avatar, :password, :password_confirmation])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :avatar, :password, :password_confirmation, :current_password])
  end

  private

  # q: how can i update the user in the method below?


  def respond_with(resource, _opts = {})
    if request.method === "POST" && resource.persisted?
      render json: {
        status: {code: 200, message: 'Signed up sucessfully.'},
        data: resource
      }, status: :ok
    elsif request.method === "PUT" && resource.persisted?
      @user = User.find_by(id: current_user.id)
      @user.update({ username: resource.username, email: resource.email, avatar: resource.avatar, password: resource.password, password_confirmation: resource.password_confirmation })
      render json: {
        status: {code: 200, message: 'Account updated sucessfully.'},
        data: resource
      }, status: :ok
    elsif request.method === "DELETE"
      render json: {
        status: {code: 200, message: 'Account deleted sucessfully.'}
      }, status: :ok
    else
      render json: {
        status: {code: 422, message: "User could not be created successfully. #{resource.errors.full_messages.to_sentence}"}
      }, status: :unprocessable_entity
    end
    # q: why is the above method not updating the user?





  end

  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_upf
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
