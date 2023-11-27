# frozen_string_literal: true

module HexletCode
  class Label
    attr_reader :tag, :attr, :value

    def initialize(name)
      @tag = 'label'
      @attr = { 'for' => name }
      @value = name.capitalize
    end
  end
end
