class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
  def nowacena_notification
    @unsubcribe = Rails.application.message_verifier(:unsubscribe).generate(@user.id)
    @info = params[:productshop]
    if(@recipient.subbed==true)
    mail(to: @recipient.email, subject: 'Nowa cena!');
    end
    end
end
