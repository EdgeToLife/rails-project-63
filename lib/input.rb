# frozen_string_literal: true

# The HexletCode module
module HexletCode
  # The Input tag render
  class Input
    def self.render(user, name, node)
      value = user[name]
      attr = { type: 'text', value: value.to_s }
      attr = node.merge(attr)
      attr = Tag.build_attributes [attr]
      "<input#{attr}>"
    end
  end
end
