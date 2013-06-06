class ApplicationController < ActionController::Base
  before_filter :set_locale

  protect_from_forgery

private

  def authorize_admin!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    { :locale => I18n.locale }
  end
end
