# git rev-parse --short HEAD
# git rev-parse HEAD
# git log -1 --format="%s"`}
js = <<-JS
// Created at #{Time.now.strftime("%d. %B, %H:%M Uhr")}
//
#{`git log -1 HEAD --format=short | ruby -e 'puts ARGF.lines.select{ ARGF.lineno > 3 }.map{ |k| "//" + k } '`}//
//    #{`git log -1 --format="%H"`}//
JS

files_to_load = Dir["files/**"]
File.open("words.js", "w") do |file|
	file.puts js
	file.puts "Wortschatz.prototype.words ="
	file.print " " * 2 + "["
	files_to_load.each_with_index do |fname, findex|
		source_file = File.open(fname)
		count = %x{wc -l #{fname}}.split.first.to_i
		source_file.lines.each_with_index do |a, i|
			next if a.start_with?("#")
         a.strip!
         a += ";#{fname.split("/").last}"
			str = "\"#{a}\""
			str = " " * 3 + str if !(findex.zero? && i == 1)
			unless findex+1 == files_to_load.size && i == count
				str << ",\n"
			end
			if findex == (files_to_load.size - 1) &&
				 i == count
				str = str + "]"
			end
			file.print str
		end
	end
end

`mv words.js ../wortschatz_extension`