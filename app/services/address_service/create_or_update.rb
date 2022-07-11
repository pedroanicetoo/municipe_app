# frozen_string_literal: true

module AddressService
  class CreateOrUpdate < ApplicationService

    attr_reader :zipcode, :publicplace, :complement, :district, :city, :uf, :status, :ibgecode, :address, :action

    def initialize(address_params, action, address = nil)
      @action         = action
      @zipcode        = address_params[:zipcode]
      @publicplace    = address_params[:publicplace]
      @complement     = address_params[:complement]
      @district       = address_params[:district]
      @city           = address_params[:city]
      @uf             = address_params[:uf]
      @ibgecode       = address_params[:ibgecode]
      @address        = address
    end

    def before; end

    def call
      ActiveRecord::Base.transaction { send(action) }
      @address
    end

    def after; end

    private

    def create
      @address = Address.new(assign_params)
      @address.save 
      @address
    end

    def update
      address.update(assign_params)
      @address = address
    end

    def assign_params
      {
        zipcode: zipcode,
        publicplace: publicplace,
        complement: complement,
        district: district,
        city: city,
        uf: uf,
        ibgecode: ibgecode
      }
    end
  end
end
