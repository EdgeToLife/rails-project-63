# frozen_string_literal: true

require_relative 'hexlet_code/version'

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
    render.render(params)
  end

  class Render
    def initialize(nodes)
      @nodes = nodes
    end

    def render(params)
      Tag.build('form', params) do |_|
        html = ''
        @nodes.each do |node|
          html += if node.value.nil?
                    Tag.build(node.tag, node.attr)
                  else
                    Tag.build(node.tag, node.attr) { node.value }
                  end
        end
        html
      end
    end
  end
end
