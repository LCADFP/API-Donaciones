class UserTokenController < Knock::AuthTokenController

    skip_before_action :verify_authenticity_token, raise: false

    def create #crea sesion

        @user=User.where("email = ?",params[:auth][:email]).first;
        
        if @user.email_confirmed # verificar si ya se ha confirmado la cuenta

            render json: {
                jwt: auth_token.token,
                user: @user
            }, status: :created
        else
            render json: { error: 'No ha confirmado la cuenta' }, status: :unauthorized
        end
        
    end    
    
end
