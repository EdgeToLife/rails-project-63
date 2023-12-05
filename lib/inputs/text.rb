# frozen_string_literal: true

module HexletCode
  class Text
    attr_reader :tag, :attr, :content

    def initialize(user, name, opts)
      @tag = 'textarea'
      @attr = { 'name' => name, :cols => 20, :rows => 40 }
      opts = opts.except(:as)
      @attr = attr.merge(opts)
      @content = user[name].to_s
    end
  end
end
