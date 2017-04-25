# Treedent

[![Gem Version](https://badge.fury.io/rb/treedent.svg)](https://badge.fury.io/rb/treedent)
[![Build Status](https://travis-ci.org/Aupajo/treedent.svg?branch=master)](https://travis-ci.org/Aupajo/treedent)
[![Code Climate](https://codeclimate.com/github/Aupajo/treedent.png)](https://codeclimate.com/github/Aupajo/treedent)


A command-line tool for generating `tree`-like formatted output from indented plain text.

## Installation

    gem install treedent

## Usage

Pass `treedent` a file or pipe it some content, and it will format your text as an ASCII tree:

    $ cat family-tree.txt

    Starks
      Ned & Catelyn
        Robb
        Sansa
        Arya
        Bran
        Rickon
        Jon Snow
    Lannisters
      Tywin & Joanna
        Cersei
          Joffrey
          Myrcella
          Tommen
        Jamie
        Tyrion
      Kevan & Dorna
        Lancel

    $ treedent family-tree.txt

      Starks
      └── Ned & Catelyn
          ├── Robb
          ├── Sansa
          ├── Arya
          ├── Bran
          ├── Rickon
          └── Jon Snow
      Lannisters
      ├── Tywin & Joanna
      │   ├── Cersei
      │   │   ├── Joffrey
      │   │   ├── Myrcella
      │   │   └── Tommen
      │   ├── Jamie
      │   └── Tyrion
      └── Kevan & Dorna
          └── Lancel

`treedent` reads from stdin (i.e. `treedent < notes.txt` or `cat notes.txt | treedent` will work).

Run `treedent --help` for more options.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Aupajo/treedent. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
