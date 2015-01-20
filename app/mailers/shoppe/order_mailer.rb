module Shoppe
  class OrderMailer < ActionMailer::Base

    def received(order)
      @order = order
      mail :from => Shoppe.settings.outbound_email_address, :to => order.email_address, :subject => 'Potwierdzenie złożenia zamówienia w Włóczka Cafe'
    end

    def accepted(order)
      @order = order
      mail :from => Shoppe.settings.outbound_email_address, :to => order.email_address, :subject => 'Zamówienie przyjęte do realizacji'
    end

    def rejected(order)
      @order = order
      mail :from => Shoppe.settings.outbound_email_address, :to => order.email_address, :subject => I18n.t('shoppe.order_mailer.received.rejected', :default => "Order Rejected")
    end

    def shipped(order)
      @order = order
      mail :from => Shoppe.settings.outbound_email_address, :to => order.email_address, :subject => 'Zamówienie zostało wysłane'
    end

  end
end
