class UserMailer < ActionMailer::Base
  default from: "novicetoninja99@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    @greeting = "Hi"

    mail to: user.email, subject: "Password Reset"
  end

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Novice to Ninja')
  end

  def signup_email(user)
    @user = user
    mail(to: 'novicetoninja99@gmail.com', subject: 'New user just signed up!')
  end
end
