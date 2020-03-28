class AdministratorMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.administrator_mailer.account_activation.subject
  #
  def account_activation(administrator)
    @administrator = administrator
    mail to: administrator.email, subject: "Account activation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.administrator_mailer.password_reset.subject
  #
  def password_reset(administrator)
    @administrator = administrator
    mail to: administrator.email, subject: "Password reset"
  end
end
