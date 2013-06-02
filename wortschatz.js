// Created at 02. June, 22:47 Uhr
//
// * Added the import script, to collect the most recent vocabulary words and to move it to the extension folder to keep them in sync as much as possible. * Commited the wortschatz that i currently use in my cli.
// 31d0409a5a21b4d57de8739fc304f8e071c755f7
//
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

         if(now - lastSet > 30000){
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

Wortschatz.prototype.words =
  ["ärgerlich;desagradable, molesto, enfadado;adjetivo",
   "begeistert;entusiasmado;adjetivo",
   "bunt;multicolor, variado;adjetivo",
   "einzeln;sólo, único;adjetivo",
   "kurz;corto;adjetivo",
   "lang;largo;adjetivo",
   "elegant;elegante;adjetivo",
   "eng;estrecho;adjetivo",
   "weit;ancho, holgado, lejos;adjetivo",
   "komplett;completo;adjetivo",
   "schrecklich;horrible;adjetivo",
   "teuer;caro;adjetivo",
   "billig;barato;adjetivo",
   "alleinerziehend;padre/madre soltero;adjetivo",
   "wenig;poco;adjetivo",
   "ausgebucht;reservado;adjetivo",
   "beliebt;popular, apreciado;adjetivo",
   "notwendig;necesario, inevitable. urgentemente, inmediatamente;adjetivo",
   "schneebedeckt;cubierto de nieve;adjetivo",
   "tief;profundo, hondo, bajo;adjetivo",
   "traumhaft;de ensueño;adjetivo",
   "geduldig;paciente;adjetivo",
   "geeignet;apropiado, adecuado;adjetivo",
   "gegenseitig;recíproco, mutuamente;adjetivo",
   "geistig;mental, intelectual;adjetivo",
   "interessant;interesante;adjetivo",
   "lebendig;vivaz, interesante, vivamente;adjetivo",
   "ökologisch;ecológicamente;adjetivo",
   "speziell;especial;adjetivo",
   "annehmen;aceptar, adoptar, aprobar, suponer;verbo",
   "sich bedanken;agradecer;verbo",
   "bestehen;aprobar, (una duda)existir, componerse de algo;verbo",
   "bringen;llevar, traer, publicar, emitir;verbo",
   "dazugehören;formar parte;verbo",
   "meinen;creer, pensar, referirse, querer decir;verbo",
   "riechen;oler;verbo",
   "schenken;regalar, ahorrarse algo;verbo",
   "übernachten;pernoctar, pasar la noche;verbo",
   "weggehen;irse, (algo)desaparece;verbo",
   "werfen;lanzar;verbo",
   "zusammenleben;vivir juntos, vivir con alguien;verbo"]