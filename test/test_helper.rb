# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'

def get_fixture(name)
  File.read("./test/html-fixtures/#{name}.html")
end
