# frozen_string_literal: true

module HexletCode
  class Input
    attr_reader :tag, :attr, :value

    def initialize(user, name, opts)
      @tag = 'input'
      @attr = { 'name' => name, 'type' => 'text', 'value' => user.public_send(name) }
      @attr = opts.merge(attr)
      @value = nil
    end
  end
end
