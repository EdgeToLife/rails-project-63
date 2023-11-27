# frozen_string_literal: true

module HexletCode
  class Submit
    attr_reader :tag, :attr, :value

    def initialize(name)
      @tag = 'input'
      @attr = { 'type' => 'submit', 'value' => name }
      @value = nil
    end
  end
end
