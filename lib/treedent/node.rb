module Treedent
  class Node
    attr_reader :value, :parent
    attr_accessor :successor

    def initialize(value = nil, parent = nil, successor = nil)
      @value, @parent, @successor = value, parent, successor
    end

    def depth
      @depth ||= ancestors.count
    end

    def final_sibling?
      successor.nil? || successors.all? { |node| node.parent != parent }
    end

    def successors_only_descend?
      successors.all? { |node| node.depth >= depth }
    end

    def orphan?
      parent.root?
    end

    def last?
      successor.nil?
    end

    def root?
      value.nil?
    end

    def ancestors(&block)
      traverse_relationship(:parent, &block)
    end

    def successors(&block)
      traverse_relationship(:successor, &block)
    end

    private

    def traverse_relationship(relation, &block)
      return enum_for(:traverse_relationship, relation) unless block_given?
      
      node = self
      yield node while node = node.public_send(relation)
    end
  end
end
