// Created at 27. May, 01:02 Uhr
//
// * adjektiven. Kapitel 13, small fixes. * added verben file.
// b80d26c265a77261e810e4ab0b3d30f0eef029b9
//
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

Wortschatz.words =
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