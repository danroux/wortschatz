#! /usr/bin/env ruby
files = Dir["#{File.dirname(__FILE__)}/files/**"].collect{ |source| open(File.expand_path(source)) }
words = files.collect do |f|
	f.lines.select{ |l| !l.start_with?("#") }.map do |line|
		"#{File.basename(f)};#{line}"
	end.map(&:chomp)
end.flatten
word, tr, type = words.sample.split(";")
sep = '%F{blue}|'
colors = ["black", "blue", "yellow", "blue", "yellow"]
print words.sample.split(";").enum_for(:each_with_index)
           .collect{ |k, i| "%B%F{#{colors[i]}}#{k}" }.join(" #{sep} ")
puts
#puts "%B%F{yellow}#{type} #{sep} %F{green}#{word} #{sep} %F{blue}#{tr}%b"