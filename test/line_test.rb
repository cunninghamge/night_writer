require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require './lib/line'

class LineTest < Minitest::Test
  def setup
    line = "this sentence has more than forty characters.\n"
    @parent = mock("Translator")
    @line = Line.new(line, @parent)
  end

  def test_it_exists
    assert_instance_of Line, @line
  end

  def test_attributes
    assert_equal "this sentence has more than forty characters.\n", @line.printed
  end

  def test_split_at_max_characters
    expected = ["this sentence has more than forty", "characters."]
    assert_equal expected, @line.split_at_max_characters
  end

  def test_translate_character
    @parent.stubs(:translate_character).returns(["0.", "..", ".."])
    assert_equal ["0.", "..", ".."], @line.translate_character("a")
  end

  def test_translate_line
    line1 = Line.new("a\n", @parent)
    @parent.stubs(:translate_character).returns(["0.", "..", ".."])
    assert_equal [[["0.", "..", ".."]]], line1.translate_line

    line2 = Line.new("aa\n", @parent)
    @parent.stubs(:translate_character).returns(["0.", "..", ".."])
    assert_equal [[["0.", "..", ".."], ["0.", "..", ".."]]], line2.translate_line
  end

  def test_create_braille_lines
    actual = @line.create_braille_lines
    assert_instance_of Array, actual
    all_braille_lines = actual.all? do |line|
      line.class == BrailleLine
    end
    assert_equal true, all_braille_lines
    assert_equal 2, actual.count
  end
end
