# frozen_string_literal: true

# Form module
module HexletCode
  # Form Builder class
  class FormBuilder
    attr_reader :nodes

    def initialize(user)
      @user = user
      @nodes = []
    end

    def input(name, options = {})
      @user.public_send(name)
      add_node(options.merge({ 'name' => name }))
    end

    def submit(name = 'Save')
      add_node({ 'name' => name, 'type' => 'submit' })
    end

    private

    def add_node(node)
      @nodes << node
    end
  end
end
