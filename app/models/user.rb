class User < ApplicationRecord
    has_secure_password

    belongs_to :role

    before_create :set_confirmation_token

    ########Confirmacion de cuenta######################
    def validate_email
        self.email_confirmed = true
        self.confirm_token = nil                
    end

    
    def set_confirmation_token
        if self.confirm_token.blank?
            self.confirm_token = SecureRandom.urlsafe_base64.to_s
        end
    end
    #######################################################

    ##########Recordar contraseña##########################

    def send_password_reset
        generate_token(:password_reset_token)
        self.password_reset_sent_at = Time.zone.now
        save!
        UserMailer.password_reset(self).deliver
    end

    def generate_token(column)
        begin
            self[column] = SecureRandom.urlsafe_base64
        end while User.exists?(column => self[column])
    end
    
    
end
