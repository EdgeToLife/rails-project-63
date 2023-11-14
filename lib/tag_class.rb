# frozen_string_literal: true

# Tag module
module Tag
  # The Tag class is an HTML tag with attributes and content.
  # It is used to generate HTML code from Ruby objects.
  class Tag
    def self.build(tag, *options)
      params = HexletCode.build_attributes options
      block_given? ? "<#{tag}#{params}>#{yield}</#{tag}>" : "<#{tag}#{params}></#{tag}>"
    end
  end
end
