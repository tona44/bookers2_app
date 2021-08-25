class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :redirect_login, only: [:index,:show,:edit]   #未ログインの場合、URL直打ちしてもログイン画面へ(protected以下で遷移先設定)
  
  def after_sign_in_path_for(resource)  #ログイン後にマイページへ移動
    user_path(resource)
  end
  
  def after_sign_out_path_for(resouce)  #ログアウト後にトップページへ移動
    root_path
  end


  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
  
  # def redirect_login
  #   redirect_to new_user_session_path unless user_signed_in?
  # end

end
