module Spree::Chimpy
  class Configuration < Spree::Preferences::Configuration
    preference :store_id,              :string,  default: 'spree'
    preference :subscribed_by_default, :boolean, default: false
    preference :subscribe_to_list,     :boolean, default: false
    preference :key,                   :string
    preference :list_name,             :string,  default: 'Members'
    preference :list_id,               :string,  default: nil
    preference :customer_segment_name, :string,  default: 'Customers'
    preference :merge_vars,            :hash,    default: { 'EMAIL' => :email }
    preference :api_options,           :hash,    default: { timeout: 60 }
    preference :double_opt_in,         :boolean, default: false
    preference :send_welcome_email,    :boolean, default: true
    preference :merchant_list_name,    :string,  default: 'Merchants'
    preference :merchant_list_id,      :string,  default: nil
    preference :merchant_merge_vars,   :hash,    default: { 'EMAIL' => :email, 'FNAME' => :firtsname, 'BRANDNAME' => :name, 'PHONE' => :phone }
  end
end