# git rev-parse --short HEAD
# git rev-parse HEAD

js = <<-JS
// Created at #{Time.now.strftime("%d. %B, %H:%M Uhr")}
//
// #{`git log -1 --format="%s"`}// #{`git log -1 --format="%H"`}//
function Wortschatz(){
   this.pickRandom = function(){
      var selected = this.words[Math.floor(Math.random()*this.words.length)];
      selected = selected.split(";").join(" | ");
      return selected;
   };

   this.__defineGetter__("current", function(){
      var now = new Date();
      var word;
      var lastSetExt;
      var div = document.createElement("div");
      div.id = "vocabulary_ordinary_id";
      div.className = "bottom_right";
      var that = this;
      chrome.storage.local.get(null, function(items) {
         lastSet = new Date(items['last_set']);

         if(now - lastSet > 300000){
            word = that.pickRandom();
            that.current = word;
         } else{
            word = items['current'];
         }

         div.innerHTML = word;
      });

      this.clearUp();
      document.body.appendChild(div);
      return word;
   });

   this.__defineSetter__("current", function(currentWord){
      var lastSet = new Date().toString();

      var dataObj = {}
      dataObj['current'] = currentWord;
      dataObj['last_set'] = lastSet;
      chrome.storage.local.set(dataObj, function() { /*...*/ });
   });

   this.clearUp = function(){
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
	file.puts "Wortschatz.prototype.words ="
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

`mv wortschatz.js ../wortschatz_extension`