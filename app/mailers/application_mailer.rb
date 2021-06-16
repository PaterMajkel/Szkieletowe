class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
  def nowa_cena

    @info = params[:productshop]
    if params[:recipient].kind_of?(Array)
    params[:recipient].each do |user|
      @user=user
    if(@user.subbed==true)
      puts @user.id
      @unsubscribe = Rails.application.message_verifier(:unsubscribe).generate(@user.id)
      puts @unsubscribe
      mail(to: user.email, subject: 'Nowa cena!');

      end
    end

  else
    @user=params[:recipient]
      if(@user.subbed==true)
        puts @user.id
        @unsubscribe = Rails.application.message_verifier(:unsubscribe).generate(@user.id)
        puts @unsubscribe
        mail(to: @user.email, subject: 'Nowa cena!');
    end
    end
  end
  end
