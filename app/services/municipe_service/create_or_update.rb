# frozen_string_literal: true

module MunicipeService
  class CreateOrUpdate < ApplicationService

    attr_reader :fullname, :cpf, :cns, :email, :birthdate, :phone, :status,
                :address_params, :avatar, :action, :municipe, :old_status

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
      @old_status     = municipe.try(:status)
    end

    def before;end

    def call
      ActiveRecord::Base.transaction do
        send(action)

        send_notification if action == :create || status_changed
        @municipe
      end
    end

    def after;end

    private

    def create
      @municipe = Municipe.new(assign_params)
      return @municipe unless @municipe.valid?

      @municipe.save
      @municipe
    end

    def update
      municipe.update(assign_params_to_update)
      @municipe = municipe
    end

    def address_params_to_create
      {
        zipcode:     address_params[:zipcode],
        publicplace: address_params[:publicplace],
        complement:  address_params[:complement],
        district:    address_params[:district],
        city:        address_params[:city],
        uf:          address_params[:uf],
        ibgecode:    address_params[:ibgecode]
      }
    end

    def address_params_to_update(address)
      {
        zipcode:     address_params[:zipcode].blank? ? address.zipcode : address_params[:zipcode],
        publicplace: address_params[:publicplace].blank? ? address.publicplace : address_params[:publicplace],
        complement:  address_params[:complement].blank? ? address.complement : address_params[:complement],
        district:    address_params[:district].blank? ? address.district : address_params[:district],
        city:        address_params[:city].blank? ? address.city : address_params[:city],
        uf:          address_params[:uf].blank? ? address.uf : address_params[:uf],
        ibgecode:    address_params[:ibgecode].blank? ? address.ibgecode : address_params[:ibgecode]
      }
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
        address_attributes: address_params_to_create
      }
    end

    def assign_params_to_update
      {
        fullname: fullname.blank? ? municipe.fullname : fullname,
        avatar: avatar.blank? ? municipe.avatar : avatar,
        cpf: cpf.blank? ? municipe.cpf : cpf,
        cns: cns.blank? ? municipe.cns : cns,
        email: email.blank? ? municipe.email : email,
        birthdate: birthdate.blank? ? municipe.birthdate : birthdate,
        phone: phone.blank? ? municipe.phone : phone,
        status: status.blank? ? municipe.status : status,
        address_attributes: address_params_to_update(municipe.address)
      }
    end

    def adrress_by_municipe
      Address.find(municipe.id)
    end

    def send_notification
      return unless @municipe.valid?

      NotificationService::Send.call(@municipe, "Usuário Criado com Sucesso")
    end

    def status_changed
      action == :update && old_status != municipe.status
    end

  end
end
