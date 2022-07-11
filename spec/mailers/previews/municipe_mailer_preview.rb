# Preview all emails at http://localhost:3000/rails/mailers/municipe_mailer
class MunicipeMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/municipe_mailer/data_change_email
  def data_change_email
    MunicipeMailer.data_change_email
  end

end
