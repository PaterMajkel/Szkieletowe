class WebnotificationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    user=current_user
    user.update(subbed: true)
  end
  def create
    notification = WebNotification.find_by(auth_key: params[:keys][:auth])
    unless notification
      @notification = WebNotification.new(user_id: current_user.id,
                                          endpoint: params[:endpoint],
                                          auth_key: params[:keys][:auth],
                                          p256dh_key: params[:keys][:p256dh])
    end
    if @notification.save
      render json: @notification
    else
      render json: @notification.errors.full_messages
    end
  end
end
