class Spree::Chimpy::SubscribersController < Spree::BaseController
  # respond_to :html
  layout "spree/layouts/blank"

  def create
    @errors = []
    if params[:chimpy_subscriber][:email].blank?
      @errors << I18n.t("spree.chimpy.subscriber.missing_email")
    elsif params[:chimpy_subscriber][:email] !~ /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i
      @errors << I18n.t("spree.chimpy.subscriber.missing_email")
    else
      if Spree::Chimpy::Subscriber.where(email: params[:chimpy_subscriber][:email]).first
        @errors <<  params[:chimpy_subscriber]
        @errors << I18n.t("spree.chimpy.subscriber.already")
      else
        @subscriber = Spree::Chimpy::Subscriber.where(email: params[:chimpy_subscriber][:email]).first_or_initialize
        @subscriber.update_attributes(params[:chimpy_subscriber])
        @subscriber.profile = params[:user_type]
        @subscriber.utm_source ||= cookies[:utm_source]
        @subscriber.utm_campaign ||= cookies[:utm_campaign]
        @subscriber.utm_medium ||= cookies[:utm_medium]
        if @subscriber.save
          Spree::Chimpy::Subscription.new(@subscriber).subscribe
          # user = Spree::User.where(email:params[:chimpy_subscriber][:email]).first
          # if user
          #   user.subscribed = true
          #   user.save
          # end
          flash[:newsletter_subscription_tracking] = "nothing special"
          # flash[:notice] = I18n.t("spree.chimpy.subscriber.success")
        else
          @errors <<  params[:chimpy_subscriber]
          @errors << I18n.t("spree.chimpy.subscriber.failure")
        end
      end
    end

    respond_to do |format|
      format.js
      format.html
    end
    # respond_with @subscriber, location: request.referer
  end

  def success
    flash[:newsletter_subscription_tracking] = "nothing special"
    render "create"
  end
end
