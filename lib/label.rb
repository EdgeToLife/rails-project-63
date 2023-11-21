# frozen_string_literal: true

# The HexletCode module
module HexletCode
  # The Label tag render
  class Label
    def self.render(name)
      "<label for='#{name}'>#{name.capitalize}</label>"
    end
  end
end
