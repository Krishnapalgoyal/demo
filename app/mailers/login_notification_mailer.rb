class LoginNotificationMailer < ApplicationMailer

  def create_notification(object)
    @object = object

    mail to: 'admin@example.com',subject:"new entry for#{object.class} is created "
  end
end
