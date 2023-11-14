# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'tag_class'

# The HexletCode module
module HexletCode
  class Error < StandardError; end
  include Tag

  def self.form_for(user, params = {})
    builder = FormBuilder.new(user)
    yield builder
    Render.to_html(user, builder.elements, params)
  end

  def self.build_attributes(options)
    params = []
    options.each do |p|
      p.each do |key, value|
        params << "#{key}='#{value}'"
      end
    end
    params = params.any? ? " #{params.join(' ')}" : ''
  end

  # Form Builder class
  class FormBuilder
    attr_reader :elements

    def initialize(user)
      @user = user
      @elements = []
    end

    def add_element(element)
      @elements << element
    end

    def input(name, options = {})
      @user.public_send(name)
      add_element(options.merge({ 'name' => name }))
    end

    def submit(name = 'Save')
      add_element({ 'name' => name, 'type' => 'submit' })
    end
  end

  # Form Render class
  class Render
    def self.to_html(user, feilds, params)
      url = params.delete(:url) || '#'
      method = params.delete(:method) || 'post'
      form_attr = HexletCode.build_attributes [params]
      html = "<form action='#{url}' method='#{method}'#{form_attr}>"
      html += render_feilds feilds, user
      "#{html}</form>"
    end

    def self.render_feilds(feilds, user)
      html = ''
      feilds.each do |node|
        name = node['name']
        if node[:as] == :text
          html += render_label name
          html += render_textarea(user, name, node)
        elsif node['type'] == 'submit'
          html += render_submit node
        else
          html += render_label name
          html += render_input(user, name, node)
        end
      end
      html
    end

    def self.render_input(user, name, node)
      value = user[name]
      attr = { type: 'text', value: value }
      attr = node.merge(attr)
      attr = HexletCode.build_attributes [attr]
      "<input#{attr}>"
    end

    def self.render_textarea(user, name, node)
      node.delete(:as)
      attr = { cols: 20, rows: 40 }
      attr = attr.merge(node)
      attr = HexletCode.build_attributes [attr]
      "<textarea#{attr}>#{user[name]}</textarea>"
    end

    def self.render_submit(node)
      "<input type='submit' value='#{node['name']}'>"
    end

    def self.render_label(name)
      "<label for='#{name}'>#{name.capitalize}</label>"
    end
  end
end
