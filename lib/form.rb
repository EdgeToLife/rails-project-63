# frozen_string_literal: true

# Form module
module HexletCode
  # Form Builder class
  class FormBuilder
    attr_reader :elements

    def initialize(user)
      @user = user
      @elements = []
    end

    def input(name, options = {})
      @user.public_send(name)
      add_element(options.merge({ 'name' => name }))
    end

    def submit(name = 'Save')
      add_element({ 'name' => name, 'type' => 'submit' })
    end

    private

    def add_element(element)
      @elements << element
    end
  end
end
