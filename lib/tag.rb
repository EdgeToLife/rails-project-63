# frozen_string_literal: true

# The HexletCode module
module HexletCode
  # The Tag class is an HTML tag with attributes and content.
  # It is used to generate HTML code from Ruby objects.
  class Tag
    def self.build(tag, *options)
      params = build_attributes options
      block_given? ? "<#{tag}#{params}>#{yield}</#{tag}>" : "<#{tag}#{params}></#{tag}>"
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

    def self.build_tag(user, node)
      html = ''
      name = node['name']
      if node[:as] == :text
        html += Label.render(name)
        html += Text.render(user, name, node)
      elsif node['type'] == 'submit'
        html += Submit.render(node)
      else
        html += Label.render(name)
        html += Input.render(user, name, node)
      end
      html
    end
  end
end
