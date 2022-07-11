# frozen_string_literal: true

module MunicipeService
  class CreateOrUpdate < ApplicationService

    attr_reader :fullname, :cpf, :cns, :email, :birthdate, :phone, :status, 
                :address_params, :address, :avatar, :action, :municipe

    def initialize(municipe_params, action, municipe = nil)
      @action         = action
      @fullname       = municipe_params[:fullname]
      @avatar         = municipe_params[:avatar]
      @cpf            = municipe_params[:cpf]
      @cns            = municipe_params[:cns]
      @email          = municipe_params[:email]
      @birthdate      = municipe_params[:birthdate]
      @phone          = municipe_params[:phone]
      @status         = municipe_params[:status]
      @address_params = municipe_params[:addresses]
      @municipe       = municipe
    end

    def before; end

    def call
      ActiveRecord::Base.transaction { send(action) }
      @municipe
    end

    def after 
      return if status_dont_changed

      send_notification 
    end

    private

    def create
      call_address(action)
      create_municipe
    end

    def update
      call_address(action, municipe.address)
      update_municipe
    end

    def call_address(action, address = nil)
      @address = AddressService::CreateOrUpdate.call(address_params, action, address)
    end

    def create_municipe
      @municipe = Municipe.new(assign_params)
      @municipe.save
      @municipe
    end

    def update_municipe
      @municipe.update(assign_params)
      @municipe
    end

    def assign_params
      {
        fullname: fullname,
        avatar: avatar,
        cpf: cpf,
        cns: cns,
        email: email,
        birthdate: birthdate,
        phone: phone,
        status: status,
        address_id: @address.id
      }
    end

    def adrress_by_municipe
      Address.find(municipe.id)
    end

    def send_notification
      NotificationService::Send.call(@municipe, "Usuário Criado com Sucesso")
    end

    def status_dont_changed
      action == :update && (status == @municipe.status)
    end

  end
end
