# frozen_string_literal: true

# The HexletCode module
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
      label = Label.new(name)
      add_node(label)
      node = if options[:as] == :text
               Text.new(@user, name, options)
             else
               Input.new(@user, name, options)
             end
      add_node(node)
    end

    def submit(name = 'Save')
      node = Submit.new(name)
      add_node(node)
    end

    private

    def add_node(node)
      @nodes << node
    end
  end
end
