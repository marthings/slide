class UserMailer < ApplicationMailer
  default from: 'notifications@preze.com'

  def welcome_email
    @user = params[:user]
    @url  = 'http://preze.com/login'
    mail(to: @user.email, subject: 'Welcome to Preze!')
  end
end
