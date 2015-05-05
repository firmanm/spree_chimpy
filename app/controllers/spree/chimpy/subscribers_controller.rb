class Spree::Chimpy::SubscribersController < ApplicationController
  # respond_to :html
  layout "spree/layouts/blank"

  def create
    @subscriber = Spree::Chimpy::Subscriber.where(email: params[:chimpy_subscriber][:email]).first_or_initialize
    @subscriber.update_attributes(params[:chimpy_subscriber])
    if @subscriber.save
      Spree::Chimpy::Subscription.new(@subscriber).subscribe
      flash[:notice] = I18n.t("spree.chimpy.subscriber.success")
      @success = true
    else
      flash[:error] = I18n.t("spree.chimpy.subscriber.failure")
      @success = false
    end

    respond_to do |format|
      format.js
      format.html
    end
    # respond_with @subscriber, location: request.referer
  end
end
