# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end

  class Tag
    result = ''
    def self.build(html_tag, *html_options)
      params = []

      html_options.each do |p|
        p.each do |key, value|
          params << "#{key}=\"#{value}\""
        end
      end

      if params.any?
        params = " " + params.join(" ")
      else
        params = ''
      end

      if html_tag == 'br'
        result = '<br>'
      elsif html_tag == 'img'
        result = "<img#{params}>"
      elsif html_tag == 'input'
        result = "<input#{params}>"
      elsif html_tag == 'label'
        result = "<label#{params}>#{yield}</label>"
      elsif html_tag == 'div'
        result = '<div></div>'
      end
    end
    result
  end
end
