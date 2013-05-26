# git rev-parse --short HEAD
# git rev-parse HEAD

js = <<-JS
// Created at #{Time.now.strftime("%d. %B, %H:%M Uhr")}
//
// #{`git log -1 --format="%s"`}// #{`git log -1 --format="%H"`}//
var Wortschatz = {
	current: function(){
		words = this.words;
		var selected = words[Math.floor(Math.random()*words.length)];
		return selected;
	},
	clearUp: function(){
		var previousElement = document.getElementById('vocabulary_ordinary_id');
		if(previousElement){
			previousElement.parentNode.removeChild(previousElement);
		}
	}
}
JS

files_to_load = ["adjektive", "verben"]
File.open("wortschatz.js", "w") do |file|
	file.puts js
	file.puts
	file.puts "Wortschatz.words ="
	file.print " " * 2 + "["
	files_to_load.each_with_index do |fname, findex|
		source_file = File.open(fname)
		count = %x{wc -l #{fname}}.split.first.to_i
		source_file.lines.each_with_index do |a, i|
			next if a.start_with?("#")
			str = "\"#{a.strip}\""
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

`cp wortschatz.js ../wortschatz_extension`