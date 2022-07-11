class MunicipeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.municipe_mailer.data_change_email.subject
  #
  def data_change_email(municipe)
    @municipe = municipe
    @address = @municipe.address
    mail to: @municipe.email, subject: 'Seus dados foram alterados'
  end
end
