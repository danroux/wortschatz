#! /usr/bin/env ruby
source = "~/gits/wortschatz/adjektive"
file = open(File.expand_path(source))
words = file.lines.map(&:to_s).map(&:chomp!)
word, tr, type = words.sample.split(";")
sep = '%F{green}|'
puts "%B%F{yellow}#{type} #{sep} %F{green}#{word} #{sep} %F{blue}#{tr}%b"