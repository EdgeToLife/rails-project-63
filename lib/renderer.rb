# frozen_string_literal: true

module HexletCode
  class Renderer
    def initialize(nodes)
      @nodes = nodes
    end

    def render(params)
      form = Form.new('form', params)
      Tag.build(form.tag, form.attr) do |_|
        @nodes.map do |node|
          if node.content.nil?
            Tag.build(node.tag, node.attr)
          else
            Tag.build(node.tag, node.attr) { node.content }
          end
        end.join
      end
    end
  end
end
