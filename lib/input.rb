# frozen_string_literal: true

module HexletCode
  class Input
    attr_reader :tag, :attr, :value

    def initialize(user, name, opts)
      user.public_send(name)
      @tag = 'input'
      @attr = { 'name' => name, 'type' => 'text', 'value' => user[name].to_s }
      @attr = opts.merge(attr)
      @value = nil
    end
  end
end
