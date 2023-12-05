# frozen_string_literal: true

require 'active_support/all'

module HexletCode
  class FormBuilder
    attr_reader :nodes, :user

    def initialize(user)
      @user = user
      @nodes = []
    end

    def input(name, options = {})
      nodes << Label.new(name)
      input_type = options[:as] || 'input'
      input_class = "HexletCode::#{input_type.capitalize}".constantize
      nodes << input_class.new(user, name, options)
    end

    def submit(name = 'Save')
      nodes << Submit.new(name)
    end
  end
end
