Deface::Override.new(:virtual_path => "spree/shared/_user_form",
                     :name         => "user_form_subscription",
                     :insert_after => "[data-hook=signup_below_password_fields]",
                     :partial      => "spree/shared/user_subscription")

# Deface::Override.new(:virtual_path => "spree/home/newindex",
#                      :name         => "spree_chimpy_subscription_form_home",
#                      :insert_bottom => "[data-hook=subscription_form]",
#                      :partial      => "spree/shared/guest_subscription")