# frozen_string_literal: true

module NotificationService
  class Send < ApplicationService

    attr_reader :municipe, :message

    def initialize(municipe, message)
      @municipe = municipe
      @message  = message
    end

    def before; end

    def call
      send_email
      send_sms
    end

    def after; end

    private

    def send_email
      MunicipeMailer.data_change_email(municipe).deliver_now!
    rescue => e
      ExceptionService::EmailErrorException.new('Email não foi enviado')
    end

    def send_sms
      client.messages.create(
        from: Rails.application.credentials.twilio_phone_number,
        to: municipe.phone,
        body: message
      )
    rescue => e
      ExceptionService::SmsErrorException.new('Não foi possível enviar o sms')
    end

    def client
      Twilio::REST::Client.new(Rails.application.credentials.twilio_account_sid, Rails.application.credentials.twilio_auth_token) 
    end

  end
end
