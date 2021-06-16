# To deliver this notification:
#
# NowaCena.with(post: @post).deliver_later(current_user)
# NowaCena.with(post: @post).deliver(current_user)

class NowaCena < Noticed::Base
  # Add your delivery methods
  #
  # deliver_by :database
  deliver_by :email, mailer: "ApplicationMailer"
  # deliver_by :slack
   deliver_by :webpush, class: "DeliveryMethods::Webpush"

  # Add required params
  #
  param :productshop
  # Define helper methods to make rendering easier.
  #
  #def message(mess)
  #   t(".message")
  #end
  #
  # def url
  #   post_path(params[:post])
  # end
end
