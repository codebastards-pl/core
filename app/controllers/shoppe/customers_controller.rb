module Shoppe
  class CustomersController < Shoppe::ApplicationController

    before_filter { @active_nav = :customers }
    before_filter { params[:id] && @customer = Customer.find(params[:id]) }
    before_filter(:only => [:create, :update, :destroy]) do
      if Shoppe.settings.demo_mode?
        raise Shoppe::Error, t('shoppe.users.demo_mode_error')
      end
    end

    def index
      @customers = Customer.order('last_sign_in_at desc')
    end

    def new
      @customer = Customer.new
    end

    def create
      @customer = Customer.new(safe_params)
      if @customer.save
        redirect_to :customer, :flash => {:notice => t('shoppe.customers.create_notice') }
      else
        render :action => "new"
      end
    end

    def edit
    end

    def update
      if @customer.update(safe_params)
        redirect_to [:edit, @customer], :flash => {:notice => t('shoppe.customers.update_notice') }
      else
        render :action => "edit"
      end
    end

    def destroy
      @customer.destroy
      redirect_to :customers, :flash => {:notice => t('shoppe.customers.destroy_notice') }
    end

    private

    def safe_params
      params[:customer].permit(:first_name, :last_name, :email, :date_of_birth)
    end

  end
end
