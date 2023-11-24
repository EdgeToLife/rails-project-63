# frozen_string_literal: true

# The HexletCode module
module HexletCode
  # The Input tag class
  class Input
    attr_reader :tag, :attr, :value

    def initialize(user, name, opts)
      @tag = 'input'
      @attr = { 'name' => name, 'type' => 'text', 'value' => user[name].to_s }
      @attr = opts.merge(attr)
      @value = nil
    end
  end
end
