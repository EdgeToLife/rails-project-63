# frozen_string_literal: true

require_relative "hexlet_code/version"
require 'action_view'

# The HexletCode module
module HexletCode
  class Error < StandardError; end

  # The Tag class is an HTML tag with attributes and content.
  # It is used to generate HTML code from Ruby objects.
  class Tag
    # rubocop:disable Metrics/MethodLength
    def self.build(html_tag, *html_options)
      params = build_attributes html_options

      case html_tag
      when "br"
        result = "<br>"
      when "img"
        result = "<img#{params}>"
      when "input"
        result = "<input#{params}>"
      when "label"
        result = "<label#{params}>#{yield}</label>"
      when "div"
        result = "<div></div>"
      end
      result
    end
    # rubocop:enable Metrics/MethodLength

    def self.build_attributes(html_options)
      params = []

      html_options.each do |p|
        p.each do |key, value|
          params << "#{key}=\"#{value}\""
        end
      end
      params = params.any? ? " #{params.join(" ")}" : ""
    end
  end

  def self.form_for(user, hash = {})
    html = ""
    if hash.empty?
      html += "<form action=\"#\" method=\"post\">"
      html += "#{yield}"
      html += "</form>"
    else
      html += "<form action=\"#{hash.fetch(:url)}\" method=\"post\"></form>"
    end
  end

  def self.input(feild, hash = {})
    html = ""
    if hash.empty?
      html += "<input name=\"name\" type=\"text\" value=\"#{hash.fetch(:name)}\">"
    else
      params = build_attributes hash
      html += "<input name=\"name\" type=\"text\" value=\"#{hash.fetch(:name)}\"#{params}>"
    end
  end
end
