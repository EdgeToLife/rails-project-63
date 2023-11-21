# frozen_string_literal: true

# The HexletCode module
module HexletCode
  # The Text area tag render
  class Text
    def self.render(user, name, node)
      node.delete(:as)
      attr = { cols: 20, rows: 40 }
      attr = attr.merge(node)
      attr = Tag.build_attributes [attr]
      "<textarea#{attr}>#{user[name]}</textarea>"
    end
  end
end
