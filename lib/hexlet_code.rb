# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'tag'
require_relative 'form'

# The Form module
module HexletCode
  class Error < StandardError; end
  #include HexletCode

  def self.form_for(user, params = {})
    builder = FormBuilder.new(user)
    yield builder
    Render.to_html(user, builder.elements, params)
  end

  # Form Render class
  class Render
    def self.to_html(user, feilds, params)
      url = params.delete(:url) || '#'
      method = params.delete(:method) || 'post'
      form_attr = HexletCode::Tag.build_attributes [params]
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
      attr = { type: 'text', value: value.to_s }
      attr = node.merge(attr)
      attr = HexletCode::Tag.build_attributes [attr]
      "<input#{attr}>"
    end

    def self.render_textarea(user, name, node)
      node.delete(:as)
      attr = { cols: 20, rows: 40 }
      attr = attr.merge(node)
      attr = HexletCode::Tag.build_attributes [attr]
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
