# frozen_string_literal: true

module HexletCode
  class Label
    attr_reader :tag, :attr, :content

    def initialize(name)
      @tag = 'label'
      @attr = { 'for' => name }
      @content = name.capitalize
    end
  end
end
