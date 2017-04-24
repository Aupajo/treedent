module Treedent
  class Tree < Struct.new(:indented_lines)
    include Enumerable

    def each
      node = root
      yield node while node = node.successor
    end

    def root
      root_node = Node.new
      parent_node = root_node
      prev_node = root_node

      indented_lines.each do |line|
        unless prev_node.root?
          if line.indentation != prev_node.value.indentation
            parent_node = prev_node

            if line.indentation < prev_node.value.indentation
              parent_node = prev_node.ancestors.find do |parent|
                parent.root? || parent.value.indentation < line.indentation
              end
            end
          end
        end

        node = Node.new(line, parent_node)
        prev_node.successor = node
        prev_node = node
      end

      root_node
    end
  end
end
