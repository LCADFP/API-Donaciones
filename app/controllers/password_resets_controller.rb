class PasswordResetsController < ApplicationController
    skip_before_action :verify_authenticity_token, only:[:create]

    def create        
        @user = User.find_by_email(params[:email])
        
         if @user
            @user.send_password_reset
            head(:ok)
         else
            head(:unprocessable_entity)
         end
    end
      
    def edit
        @user = User.find_by_password_reset_token(params[:id])
    end
      
    def update
        @user = User.find_by_password_reset_token(params[:id])
        if @user.password_reset_sent_at < 1.hours.ago
          render template: 'home/confirm_change_pass'
        elsif @user.update(password_params)
          render plain:"Ha cambiado su contraseña"
        else
          render :edit
        end
    end

    private
    def password_params
        params.require(:user).permit(:password)    
    end   

end
