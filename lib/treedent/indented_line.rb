require 'strscan'

module Treedent
  class IndentedLine < Struct.new(:indentation, :content)
    WHITESPACE_PATTERN = /[ \t]*/.freeze

    def self.from(line_string)
      scanner = StringScanner.new(line_string)
      scan = scanner.scan(WHITESPACE_PATTERN)
      indentation = (scan && scan.length) || 0
      content = scanner.rest
      new(indentation, content)
    end
  end
end
