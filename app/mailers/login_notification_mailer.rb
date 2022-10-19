class LoginNotificationMailer < ApplicationMailer

  def create_notification(object)
    @object = object
    mail to: @object.email,subject:"new entry for#{object.class} is created "
  end
end
