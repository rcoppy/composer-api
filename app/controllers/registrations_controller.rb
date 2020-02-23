class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    def create
      build_resource(sign_up_params)
  
      resource.save
      render_resource(resource)
    end

    def request_password_reset
      set_user
      if @user.send_reset_password_instructions
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end 


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(user_params[:email])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:email);
    end

  end