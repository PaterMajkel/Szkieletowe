class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
  def nowacena_notification
    mail(to: "micbo26@gmail.com", subject: 'nowa cena');
  end
end
