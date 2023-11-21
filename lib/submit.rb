# frozen_string_literal: true

# The HexletCode module
module HexletCode
  # The Submit tag render
  class Submit
    def self.render(node)
      "<input type='submit' value='#{node['name']}'>"
    end
  end
end
