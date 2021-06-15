class WebNotification < ApplicationRecord
  belongs_to :user

  def pushnotif(message,body)
    begin
      Webpush.payload_send(
        message: message+ " | "+body,
        endpoint: endpoint,
        p256dh: p256dh_key,
        auth: auth_key,
        vapid: {
          expiration: 12 * 60 * 60,
          private_key: (File.read('./vapid_keys/private_key')).to_s,
          public_key: (File.read('./vapid_keys/public_key')).to_s },
        )
    rescue Exception => exc
      logger.error("Message for the log file #{exc.message}")
      puts = "Dany adres nie jest już wspierany"
      end




  end
end
