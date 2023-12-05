# frozen_string_literal: true

module HexletCode
  class Form
    attr_reader :tag, :attr

    def initialize(name, opts)
      @tag = name
      opts[:action] = opts[:url] || '#'
      opts.delete(:url)
      opts[:method] = opts[:method] || 'post'
      @attr = opts
    end
  end
end
