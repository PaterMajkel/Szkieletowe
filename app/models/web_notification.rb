class WebNotification < ApplicationRecord
  belongs_to :user

  def pushnotif(message,body)
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

  end
end
