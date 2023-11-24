# frozen_string_literal: true

require_relative 'hexlet_code/version'

# The Form module
module HexletCode
  class Error < StandardError; end
  autoload :Tag, File.join(File.dirname(__FILE__), 'tag.rb')
  autoload :FormBuilder, File.join(File.dirname(__FILE__), 'form_builder.rb')
  autoload :Label, File.join(File.dirname(__FILE__), 'label.rb')
  autoload :Input, File.join(File.dirname(__FILE__), 'input.rb')
  autoload :Text, File.join(File.dirname(__FILE__), 'text.rb')
  autoload :Submit, File.join(File.dirname(__FILE__), 'submit.rb')
  def self.form_for(user, params = {})
    builder = FormBuilder.new(user)
    yield builder
    render = Render.new(builder.nodes)
    render.to_html(params)
  end

  # Form Render class
  class Render
    def initialize(nodes)
      @nodes = nodes
    end

    def to_html(params)
      url = params.delete(:url) || '#'
      method = params.delete(:method) || 'post'
      form_attr = Tag.build_attributes params
      html = render @nodes
      "<form action='#{url}' method='#{method}'#{form_attr}>#{html}</form>"
    end

    def render(nodes)
      html = ''
      nodes.each do |node|
        html += Tag.build(node.tag, node.attr) { node.value }
      end
      html
    end
  end
end
