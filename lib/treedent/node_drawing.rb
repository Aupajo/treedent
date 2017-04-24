module Treedent
  class NodeDrawing < Struct.new(:node)
    SPACE  = "    "
    BAR    = "│   "
    TEE    = "├── "
    CORNER = "└── "

    def to_s
      [drawings, node.value.content].compact.join
    end

    def drawings
      return [] if node.orphan?
      [outer_indentation, inner_indentation].flatten
    end

    private

    def inner_indentation
      if node.final_sibling?
        CORNER
      else
        TEE
      end
    end

    def outer_indentation
      node.ancestors.reverse_each.map do |parent|
        next if parent.root? || parent.orphan?

        if parent.final_sibling?
          SPACE
        else
          BAR
        end
      end
    end
  end
end
