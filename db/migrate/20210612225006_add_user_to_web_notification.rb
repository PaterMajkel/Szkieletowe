class AddUserToWebNotification < ActiveRecord::Migration[6.1]
  def change
    add_reference :web_notifications, :user, null: false, foreign_key: true
  end
end
