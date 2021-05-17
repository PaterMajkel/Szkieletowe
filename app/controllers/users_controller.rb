class UsersConroller< ActionController
  @user = User.new(params[:user].permit(:name))
  if verify_recaptcha(model: @user) && @user.save
    redirect_to @user
  else
    render 'new'
  end
end
