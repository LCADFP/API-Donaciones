class UserMailer < ApplicationMailer

    def registration_confirmation(user) # Metodo que envia el email de confirmacion
        @user = user
        mail(to: @user.email, subject: 'Bienvenido a ¡A Donar se dijo!')
    end

    def password_reset(user) #metodo que envia email de reset de contraseña        
        @user = user
        mail(to: @user.email, subject: 'Restablecer contraseña')
    end
    
end
