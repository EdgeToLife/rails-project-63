# frozen_string_literal: true

require_relative 'hexlet_code/version'
require 'active_support'

module HexletCode
  class Error < StandardError; end
  autoload :Tag, File.join(File.dirname(__FILE__), 'tag.rb')
  autoload :Form, File.join(File.dirname(__FILE__), 'form.rb')
  autoload :FormBuilder, File.join(File.dirname(__FILE__), 'form_builder.rb')
  autoload :Label, File.join(File.dirname(__FILE__), 'inputs/label.rb')
  autoload :Input, File.join(File.dirname(__FILE__), 'inputs/input.rb')
  autoload :Text, File.join(File.dirname(__FILE__), 'inputs/text.rb')
  autoload :Submit, File.join(File.dirname(__FILE__), 'inputs/submit.rb')
  autoload :Renderer, File.join(File.dirname(__FILE__), 'renderer.rb')

  def self.form_for(user, params = {})
    builder = FormBuilder.new(user)
    yield builder
    render = Renderer.new(builder.nodes)
    render.render(params)
  end
end
