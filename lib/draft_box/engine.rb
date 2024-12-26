require 'draft_box/delivery_method'

module DraftBox
  class Engine < ::Rails::Engine
    isolate_namespace DraftBox

    initializer 'draft_box.add_delivery_method' do
      ActiveSupport.on_load :action_mailer do
        ActionMailer::Base.add_delivery_method(
          :draft_box,
          DraftBox::DeliveryMethod,
          location: ''
        )
      end
    end
  end
end
