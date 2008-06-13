class UserMailer < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += 'Ative sua conta!'
    @body[:url]  = "#{SITE}/activate/#{user.activation_code}"
  
  end
  
  def activation(user)
    setup_email(user)
    @subject    += 'Seu cadastro foi ativado!'
    @body[:url]  = "#{SITE}/"
  end
  
  def forgot_password(user)
    setup_email(user)
    @subject    += 'Você solicitou troca de senha'
    @body[:url]  = "#{SITE}/reset_password/#{user.password_reset_code}" 
  end

  def reset_password(user)
    setup_email(user)
    @subject    += 'Sua senha foi alterada.'
  end
  
  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "web@mac.com"
      @subject     = "#{SITE}"
      @sent_on     = Time.now
      @body[:user] = user
    end
end
