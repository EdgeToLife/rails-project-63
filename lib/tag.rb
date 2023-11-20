# frozen_string_literal: true

# The HexletCode module
module HexletCode
  # The Tag class is an HTML tag with attributes and content.
  # It is used to generate HTML code from Ruby objects.
  def self.form_for(user, params = {})
      builder = Form::FormBuilder.new(user)
      yield builder
      Form::Render.to_html(user, builder.elements, params)
  end

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
  end
end
