class WebNotification < ApplicationRecord
  belongs_to :user

  def pushnotif(message)
    Webpush.payload_send(
      message: message,
      endpoint: endpoint,
      p256dh: p256dh_key,
      auth: auth_key,
      vapid: {
        private_key: (File.read('./vapid_keys/private_key')).to_s,
        public_key: (File.read('./vapid_keys/public_key')).to_s },
    )

  end
end
