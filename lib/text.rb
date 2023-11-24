# frozen_string_literal: true

# The HexletCode module
module HexletCode
  # The Text area tag render
  class Text
    attr_reader :tag, :attr, :value

    def initialize(user, name, opts)
      @tag = 'textarea'
      @attr = { 'name' => name, :cols => 20, :rows => 40 }
      opts = opts.except(:as)
      @attr = attr.merge(opts)
      @value = user[name].to_s
    end
  end
end
