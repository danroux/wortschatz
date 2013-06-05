#! /usr/bin/env ruby
files = Dir["#{File.dirname(__FILE__)}/files/**"].collect{ |source| open(File.expand_path(source)) }
words = files.collect do |k|
	k.lines.select{ |l| !l.start_with?("#") }
	 .map(&:to_s).map(&:chomp)
end.flatten
word, tr, type = words.sample.split(";")
sep = '%F{green}|'
puts "%B%F{yellow}#{type} #{sep} %F{green}#{word} #{sep} %F{blue}#{tr}%b"