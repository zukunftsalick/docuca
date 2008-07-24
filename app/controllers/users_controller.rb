class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  layout 'default'

  # render new.rhtml
  def new
    @user = User.new
  end
  
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
            #redirect_back_or_default('/login')
      flash[:notice] = "Obrigado! Em breve você receberá o código de ativação."
    else
      flash[:error]  = "Não pudemos criar sua conta. Contate o administrador."
      render :action => 'new'
    end
  end

  def activate
    logout_keeping_session!
    user = User.find_by_activation_code(params[:activation_code]) unless params[:activation_code].blank?
    case
    when (!params[:activation_code].blank?) && user && !user.active?
    #when user && user.activate
      user.activate
      flash[:notice] = "Inscrição efetuada com sucesso. Sua conta foi ativada!"
      redirect_to home_path
    when params[:activation_code].blank?
      flash[:error] = "Código de ativação inválido ou incompleto. Verifique a URL em seu email!"
      redirect_back_or_default('/login')
    else 
      flash[:error]  = " Não pudemos encontrar usuário com este código de ativação -- Cheque seu email ou tente efetuar login."
      redirect_back_or_default('/login')
    end
  end
  
  
  
  
  def change_password
        return unless request.post?
        if User.authenticate(current_user.login, params[:old_password])
          if ((params[:password] == params[:password_confirmation]) && 
                                !params[:password_confirmation].blank?)
            current_user.password_confirmation = params[:password_confirmation]
            current_user.password = params[:password]

            if current_user.save
              flash[:notice] = "Senha atualizada com sucesso" 
              redirect_to profile_url(current_user.login)
            else
              flash[:alert] = "Senha não alterada" 
            end

          else
            flash[:alert] = "Novo erro de senha" 
            @old_password = params[:old_password]
          end
        else
          flash[:alert] = "Senha antiga incorreta" 
        end
      end

      #gain email address
      def forgot_password
        return unless request.post?
        if @user = User.find_by_email(params[:user][:email])
          @user.forgot_password
          @user.save
          redirect_back_or_default('/')
          flash[:notice] = "Um email contendo informações de como resetar sua senha foi enviado." 
        else
          flash[:alert] = "Não existe este email em nosso cadastro" 
        end
      end

      #reset password
      def reset_password
        @user = User.find_by_password_reset_code(params[:id])
        return if @user unless params[:user]

        if ((params[:user][:password] && params[:user][:password_confirmation]) && 
                                !params[:user][:password_confirmation].blank?)
          self.current_user = @user #for the next two lines to work
          current_user.password_confirmation = params[:user][:password_confirmation]
          current_user.password = params[:user][:password]
          @user.reset_password
          flash[:notice] = current_user.save ? "Senha resetada com sucesso." : "Senha não foi resetada." 
          redirect_back_or_default('/')
        else
          flash[:alert] = "Erro de senha" 
        end  
      end
end
