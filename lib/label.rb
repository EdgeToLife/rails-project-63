# frozen_string_literal: true

# The HexletCode module
module HexletCode
  # The Label tag render
  class Label
    attr_reader :tag, :attr, :value

    def initialize(name)
      @tag = 'label'
      @attr = { 'for' => name }
      @value = name.capitalize
    end
  end
end
