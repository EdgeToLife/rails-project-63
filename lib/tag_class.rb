# frozen_string_literal: true

# Tag module
module Tag
  # The Tag class is an HTML tag with attributes and content.
  # It is used to generate HTML code from Ruby objects.
  class Tag
    def self.build(html_tag, *html_options)
      params = HexletCode.build_attributes html_options

      case html_tag
      when 'br'
        result = '<br>'
      when 'img'
        result = "<img#{params}>"
      when 'input'
        result = "<input#{params}>"
      when 'label'
        result = "<label#{params}>#{yield}</label>"
      when 'div'
        result = '<div></div>'
      end
      result
    end
  end
end
