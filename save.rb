# !/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'
require 'JSON'
option = ARGV.getopts('s:')

# return whether the json::parser parses input_data as json normally or not
def valid_json?(input_data)
  JSON.parse(input_data)
  true
rescue JSON::ParserError
  false
end

class String
  # colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def pink
    colorize(35)
  end
end

unless option['s'].nil?
  loop do
    print '=> '.green
    input_data = gets.chomp!

    unless valid_json?(input_data)
      puts 'Abort! Accept only JSON format!'.red
      next
    end

    print 'Do you want to record this? (y/n) :'.yellow
    ans = gets.chomp!
    unless %w[y Y].include?(ans)
      puts 'Abort!'.red
      next
    end

    File.open("data/#{option['s']}.json", 'a') do |file|
      file.puts input_data
    end
    puts 'Success!'.green
  end
end
