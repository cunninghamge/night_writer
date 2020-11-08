require "minitest/autorun"
require "minitest/pride"
require 'mocha/minitest'
require './lib/document'
require './lib/translator'

class DocumentTest < Minitest::Test
  def setup
    @braille_line1 = BrailleLine.new("a")
    @braille_line2 = BrailleLine.new("aa")
    @doc = Document.new([@braille_line1, @braille_line2])
  end

  def test_it_exists
    assert_instance_of Document, @doc
  end

  def test_it_has_lines
    assert_equal [@braille_line1, @braille_line2], @doc.braille_lines
  end

  def test_it_makes_a_translator
    assert_instance_of Translator, @doc.translator
  end

  def test_translate_lines
    @doc.translate_lines
    assert_equal [["0.", "..", ".."]], @braille_line1.braille
    assert_equal [["0.", "..", ".."], ["0.", "..", ".."]], @braille_line2.braille
  end
end
