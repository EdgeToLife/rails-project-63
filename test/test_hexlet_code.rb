# frozen_string_literal: true

require_relative "test_helper"
require_relative "../lib/hexlet_code"

# rubocop:disable Metrics/ClassLength
class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def setup
    @user = User.new name: "rob", job: "hexlet", gender: "m"
  end

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

  def test_form_for
    expected = "<form action=\"#\" method=\"post\"></form>"
    actual = HexletCode.form_for @user do |f|
    end
    assert_equal expected, actual, "Expected #{expected}, but got #{actual}"
  end

  def test_form_for_with_url
    expected = "<form action=\"/users\" method=\"post\"></form>"
    actual = HexletCode.form_for @user, url: "/users" do |f|
    end
    assert_equal expected, actual, "Expected #{expected}, but got #{actual}"
  end

  def test_form_for_with_input
    expected = File.read("./test/html-fixtures/test_form_for_with_input.html")
    actual = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job, as: :text
    end
    assert_equal expected, actual, "Expected #{expected}\nActual   #{actual}"
  end

  def test_form_for_with_input_and_url
    expected = File.read("./test/html-fixtures/test_form_for_with_input_and_url.html")
    actual = HexletCode.form_for @user, url: "#" do |f|
      f.input :name, class: "user-input"
      f.input :job
    end
    assert_equal expected, actual, "Expected #{expected}\nActual   #{actual}"
  end

  def test_form_for_with_input_and_default_values
    expected = File.read("./test/html-fixtures/test_form_for_with_input_and_default_values.html")
    actual = HexletCode.form_for @user, url: "#" do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end
    assert_equal expected, actual, "Expected #{expected}\nActual   #{actual}"
  end

  def test_form_for_with_input_and_no_method_error
    assert_raises(NoMethodError) do
      HexletCode.form_for @user, url: "#" do |f|
        f.input :name
        f.input :job, as: :text
        # Поля age у пользователя нет
        f.input :age
      end
    end
  end

  def test_form_for_with_input_and_submit
    expected = File.read("./test/html-fixtures/test_form_for_with_input_and_submit.html")
    actual = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job, as: :text
      f.submit
    end
    assert_equal expected, actual, "Expected #{expected}\nActual   #{actual}"
  end

  def test_form_for_with_input_and_renamed_submit
    expected = File.read("./test/html-fixtures/test_form_for_with_input_and_renamed_submit.html")
    actual = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job, as: :text
      f.submit "Wow"
    end
    assert_equal(expected.to_s, actual.to_s)
  end

  def test_form_for_with_submit
    user = User.new name: "rob"
    expected = "<form action=\"/profile\" method=\"get\"><input type=\"submit\" value=\"Save\"></form>"
    actual = HexletCode.form_for(user, url: "/profile", method: :get, class: "hexlet-form", &(->(f) { f.submit }))
    assert_equal(expected.to_s, actual.to_s)
  end
end
# rubocop:enable Metrics/ClassLength
