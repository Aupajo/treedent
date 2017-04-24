module Treedent
  class FormattedOutput < Struct.new(:input)

    def to_s
      tree.map { |node| NodeDrawing.new(node).to_s }.join
    end

    private

    def tree
      Tree.new(indented_lines)
    end

    def indented_lines
      input.lines.map { |line| IndentedLine.from(line) }
    end
  end
end
