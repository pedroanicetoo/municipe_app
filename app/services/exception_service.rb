# frozen_string_literal: true

module ExceptionService
  class EmailErrorException < RuntimeError; end
  class SmsErrorException < RuntimeError; end

  class ModelErrorException < RuntimeError

    attr_accessor :errors

    def initialize(errors_exception)
      raise ArgumentError unless errors_exception.is_a?(ActiveModel::Errors)

      @errors = errors_exception
    end

  end
end
