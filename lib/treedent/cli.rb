require 'treedent'
require 'pathname'

module Treedent
  class CLI
    def self.start
      return usage if options?('-h', '--help')
      return version if options?('-v', '--version')
      format
    end

    def self.usage
      puts Pathname(__dir__).join('..', '..', 'USAGE').read
    end

    def self.version
      puts "treedent #{Treedent::VERSION}"
    end

    def self.format
      puts Treedent::FormattedOutput.new(ARGF.read).to_s
    end

    def self.options?(*values)
      values.any? { |value| ARGV.include?(value) }
    end
  end
end
