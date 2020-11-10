require_relative './test_helper'
require './lib/print_translator'

class PrintTranslatorTest < Minitest::Test
  def setup
    args = ['./data/short_braille.txt', 'message.txt']
    @translator = PrintTranslator.new(args)
  end

  def test_it_exists
    assert_instance_of PrintTranslator, @translator
  end

  def test_it_makes_a_file_io
    assert_instance_of FileIO, @translator.file_io
  end

  def test_it_makes_a_parser
    assert_instance_of BrailleParser, @translator.parser
  end

  def test_create_line_objects
    actual = @translator.create_line_objects
    assert_instance_of Array, actual
    all_lines = actual.all? do |line|
      line.class == Line
    end
    assert_equal true, all_lines
  end

  def test_separate_braille_lines
    @translator.stubs(:separate_braille_lines).returns([[["0.", "..", ".."]]])

    expected = [[["0.", "..", ".."]]]
    assert_equal expected, @translator.separate_braille_lines
  end

  def test_translate_lines
    expected = ["i", " ", "a", "m", " ", "h", "e", "r", "e"]
    assert_equal expected, @translator.lines[0].translated_text
  end

  def test_compile_lines
    assert_equal "i am here\n", @translator.compile_lines
  end

  def test_multiple_lines
    @translator.stubs(:join_all_lines).returns("this sentence has more than forty\ncharacters\nthis one does not\n")

    expected = "this sentence has more than forty\ncharacters\nthis one does not\n"
    assert_equal expected, @translator.compile_lines
  end

  def test_join_all_lines
    line1 = mock("line1")
    @translator.lines.replace([line1])
    line1.stubs(:printable_text).returns("this sentence has more than forty\ncharacters\nthis one does not")
    expected = "this sentence has more than forty\ncharacters\nthis one does not\n"
    assert_equal expected, @translator.join_all_lines
  end

  def test_remove_special_characters
    text = "#a#b#cSaSbSc\n"

    assert_equal "123ABC\n", @translator.remove_special_characters(text)
  end

  def test_remove_shift
    text = "#a#b#cSaSbSc\n"

    assert_equal "#a#b#cABC\n", @translator.remove_shift(text)
  end

  def test_remove_pound
    text = "#a#b#cSaSbSc\n"

    assert_equal "123SaSbSc\n", @translator.remove_pound(text)
  end

  def test_convert_to_number
    assert_equal "1", @translator.convert_to_number("a")
  end
end
