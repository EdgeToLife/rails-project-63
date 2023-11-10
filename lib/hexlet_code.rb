# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'tag_class'

# The HexletCode module
module HexletCode
  class Error < StandardError; end
  include Tag

  def self.form_for(user, hash = {})
    url = hash.fetch(:url, '#')
    hash.delete(:url)
    method = hash.fetch(:method, 'post')
    hash.delete(:method)
    attr = HexletCode.build_attributes [hash]
    html = "<form action='#{url}' method='#{method}'#{attr}>"
    builder = FormBuilder.new(user)
    html += (yield builder).to_s
    "#{html}</form>"
  end

  def self.build_attributes(html_options)
    params = []
    html_options.each do |p|
      p.each do |key, value|
        params << "#{key}='#{value}'"
      end
    end
    params = params.any? ? " #{params.join(' ')}" : ''
  end

  # Form Builder class
  class FormBuilder
    def initialize(user)
      @user = user
      @html = ''
    end

    def input(name, options = {})
      @user.public_send(name)
      @html += "<label for='#{name}'>#{name.capitalize}</label>"
      if options.empty?
        @html += "<input name='#{name}' type='text' value='#{@user[name]}'>"
      elsif options[:as] == :text
        attr = { cols: 20, rows: 40 }
        options.delete(:as)
        attr.merge!(options)
        attr = HexletCode.build_attributes [attr]
        @html += "<textarea name='#{name}'#{attr}>#{@user[name]}</textarea>"
      else
        attr = HexletCode.build_attributes [options]
        @html += "<input name='#{name}' type='text' value='#{@user[name]}'#{attr}>"
      end
    end

    def submit(name = 'Save')
      @html += "<input type='submit' value='#{name}'>"
    end
  end
end
