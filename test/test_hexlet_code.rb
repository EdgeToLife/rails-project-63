# frozen_string_literal: true

require_relative "test_helper"
require_relative "../lib/hexlet_code"

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_build_br
    expected = "<br>"
    actual = HexletCode::Tag.build("br")
    assert_equal expected, actual, "Expected #{expected}, but got #{actual}"
  end

  def test_build_img
    expected = "<img src=\"path/to/image\">"
    actual = HexletCode::Tag.build("img", src: "path/to/image")
    assert_equal expected, actual, "Expected #{expected}, but got #{actual}"
  end

  def test_build_imput
    expected = "<input type=\"submit\" value=\"Save\">"
    actual = HexletCode::Tag.build("input", type: "submit", value: "Save")
    assert_equal expected, actual, "Expected #{expected}, but got #{actual}"
  end

  def test_build_label
    expected = "<label>Email</label>"
    actual = HexletCode::Tag.build("label") { "Email" }
    assert_equal expected, actual, "Expected #{expected}, but got #{actual}"
  end

  def test_build_label_wit_attrs
    expected = "<label for=\"email\">Email</label>"
    actual = HexletCode::Tag.build("label", for: "email") { "Email" }
    assert_equal expected, actual, "Expected #{expected}, but got #{actual}"
  end

  def test_build_div
    expected = "<div></div>"
    actual = HexletCode::Tag.build("div")
    assert_equal expected, actual, "Expected #{expected}, but got #{actual}"
  end
end
