# frozen_string_literal: true

require_relative "test_helper"
require_relative "../lib/hexlet_code.rb"

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_build_method
    expected = '<br>'
    actual = HexletCode::Tag.build('br')
    assert_equal expected, actual, "Expected #{expected}, but got #{actual}"

    expected = '<img src="path/to/image">'
    actual = HexletCode::Tag.build('img', src: 'path/to/image')
    assert_equal expected, actual, "Expected #{expected}, but got #{actual}"

    expected = '<input type="submit" value="Save">'
    actual = HexletCode::Tag.build('input', type: 'submit', value: 'Save')
    assert_equal expected, actual, "Expected #{expected}, but got #{actual}"

    expected = '<label>Email</label>'
    actual = HexletCode::Tag.build('label') { 'Email' }
    assert_equal expected, actual, "Expected #{expected}, but got #{actual}"

    expected = '<label for="email">Email</label>'
    actual = HexletCode::Tag.build('label', for: 'email') { 'Email' }
    assert_equal expected, actual, "Expected #{expected}, but got #{actual}"

    expected = '<div></div>'
    actual = HexletCode::Tag.build('div')
    assert_equal expected, actual, "Expected #{expected}, but got #{actual}"
  end
end
