require_relative 'test_helper'

describe Treedent::FormattedOutput do
  def strip_heredoc(string)
    to_strip = string.scan(/^[ \t]*(?=\S)/).min
    indent = (to_strip && to_strip.size) || 0
    string.gsub(/^[ \t]{#{indent}}/, '')
  end

  after do
    actual = Treedent::FormattedOutput.new(@input).to_s
    stripped = strip_heredoc(@output)

    if actual != stripped
      fail Minitest::Assertion, "Expected:\n#{stripped}\nGot:\n#{actual}"
    end
  end

  it "returns a single-line string as-is" do
    @input, @output = "simple", "simple"
  end

  it "handles a single child" do
    @input = <<-INPUT
      a
        b
    INPUT

    @output = <<-OUTPUT
      a
      └── b
    OUTPUT
  end

  it "handles multiple children" do
    @input = <<-INPUT
      d
        e
        f
    INPUT

    @output = <<-OUTPUT
      d
      ├── e
      └── f
    OUTPUT
  end

  it "handles nested children" do
    @input = <<-INPUT
      g
        h
          i
    INPUT

    @output = <<-OUTPUT
      g
      └── h
          └── i
    OUTPUT
  end

  it "handles complex trees" do
    @input = <<-INPUT
      j
        k
          l
          m
          n
            o
            p
        q
        r
      s
        t
        u
          v
            w
    INPUT

    @output = <<-OUTPUT
      j
      ├── k
      │   ├── l
      │   ├── m
      │   └── n
      │       ├── o
      │       └── p
      ├── q
      └── r
      s
      ├── t
      └── u
          └── v
              └── w
    OUTPUT

  end
end
