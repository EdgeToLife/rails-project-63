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
      params = HexletCode::build_attributes html_options

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
  end

  def self.form_for(user, hash = {})
    html = ""
    if hash.empty?
      html = "<form action=\"#\" method=\"post\">"
    else
      html = "<form action=\"#{hash.fetch(:url)}\" method=\"post\">"
    end
    builder = FormBuilder.new(user)
    html += (yield builder).to_s
    html += "</form>"
  end

  def self.build_attributes(html_options)
    params = []
    html_options.each do |p|
      p.each do |key, value|
        params << "#{key}=\"#{value}\""
      end
    end
    params = params.any? ? " #{params.join(" ")}" : ""
  end

  class FormBuilder
    def initialize(user)
      @user = user
      @html = ""
    end

    def input(name, options = {})
      @user.public_send(name)
      if options.empty?
        @html += "<input name=\"#{name}\" type=\"text\" value=\"#{@user[name]}\">"
      elsif options[:as] == :text
        @html += "<textarea name=\"#{name}\" cols=\"20\" rows=\"40\">#{@user[name]}</textarea>"
      else
        attr = HexletCode::build_attributes [options]
        @html += "<input name=\"#{name}\" type=\"text\" value=\"#{@user[name]}\"#{attr}>"
      end
    end
  end
end
