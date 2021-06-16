class SettingsController < ApplicationController
  def unsubscribe
    user = Rails.application.message_verifier(:unsubscribe).verify(params[:id])
    @user = User.find(user)
    if @user.update(subbed: false)
      flash[:notice] = 'Subscription Cancelled'
      redirect_to root_url
    else
      flash[:alert] = 'There was a problem'
      render :unsubscribe
    end
  end
  def update
    id=params[:id]
    @user = User.find(id)
    if @user.update(subbed: false)
      flash[:notice] = 'Subscription Cancelled'
      redirect_to root_url
    else
      flash[:alert] = 'There was a problem'
      render :unsubscribe
    end
  end
  private
  def user_params
    params.require(:user).permit(:subbed)
  end
end
