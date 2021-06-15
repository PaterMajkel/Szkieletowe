class SettingsController < ApplicationController
  def unsubscribe
    user = Rails.application.message_verifier(:unsubscribe).verify(params[:id])
    @user = User.find(user)
    redirect_to root_url
  end
  private
  def user_params
    params.require(:user).permit(:subbed)
  end
end
