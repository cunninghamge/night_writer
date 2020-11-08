require "minitest/autorun"
require "minitest/pride"
require 'mocha/minitest'
require './lib/document'

class DocumentTest < Minitest::Test
  def setup
    @braille_line1 = BrailleLine.new("this sentence has more than forty")
    @braille_line2 = BrailleLine.new("characters.")
    @doc = Document.new([@braille_line1, @braille_line2])
  end

  def test_it_exists
    assert_instance_of Document, @doc
  end

  def test_it_has_lines
    assert_equal [@braille_line1, @braille_line2], @doc.braille_lines
  end
end
