# Preview all emails at http://localhost:3000/rails/mailers/administrator_mailer
class AdministratorMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/administrator_mailer/account_activation
  def account_activation
    AdministratorMailer.account_activation
  end

  # Preview this email at http://localhost:3000/rails/mailers/administrator_mailer/password_reset
  def password_reset
    AdministratorMailer.password_reset
  end

end
