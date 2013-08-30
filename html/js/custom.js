var seed;
function duoNext(method){
    switch(method){
    case 'prev100':
        seed -= 100;
        if(seed < 1){ seed = 1; }
        break;
    case 'prev10':
        seed -= 10;
        if(seed < 1){ seed = 1; }
        break;
    case 'prev1':
        seed -= 1;
        if(seed < 1){ seed = 1; }
        break;
    case 'random':
        seed = Math.floor( Math.random() * duocount );
        break;
    case 'next1':
        seed += 1;
        if(seed > duocount){ seed = duocount; }
        break;
    case 'next10':
        seed += 10;
        if(seed > duocount){ seed = duocount; }
        break;
    case 'next100':
        seed += 100;
        if(seed > duocount){ seed = duocount; }
        break;
    default:
        seed = 1;
        break;
    }
    return [seed,duo[seed]];
}

function change(method){
   $("#en,#jp").css("display","none");
   var next = duoNext(method);
   //$("#num").html(next[0]);
   $("#en").html(next[0] + '. ' + next[1].en);
   $("#jp").html(next[1].jp);
   $("#en").css("display","block");
}
function view(){
   $("#jp").css("display","block");
}

var URL = "http://translate.google.com/translate_tts?tl=en&q=";
function readaudio(){
    var query = $("#en").html().replace(/\s/g, '+').replace(/\./g, '').replace(/\,/g, '');
    var audio = new Audio(URL+query);
    audio.play();
}

var duocount = 0;
$(function(){
  for(k in duo){
      duocount++;
  }
  change();
});