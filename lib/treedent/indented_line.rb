require 'strscan'

module Treedent
  class IndentedLine < Struct.new(:indentation, :content)
    WHITESPACE_PATTERN = /[ \t]*/

    def self.from(line_string)
      scanner = StringScanner.new(line_string)
      indentation = scanner.scan(WHITESPACE_PATTERN)&.length || 0
      content = scanner.rest
      self.new(indentation, content)
    end
  end
end
