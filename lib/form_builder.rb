# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :nodes, :user

    def initialize(user)
      @user = user
      @nodes = []
    end

    def input(name, options = {})
      nodes << Label.new(name)
      nodes << if options[:as] == :text
                 Text.new(user, name, options)
               else
                 Input.new(user, name, options)
               end
    end

    def submit(name = 'Save')
      nodes << Submit.new(name)
    end
  end
end
