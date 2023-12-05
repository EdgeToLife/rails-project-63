# frozen_string_literal: true

module HexletCode
  class Submit
    attr_reader :tag, :attr, :content

    def initialize(name)
      @tag = 'input'
      @attr = { 'type' => 'submit', 'value' => name }
      @content = nil
    end
  end
end
