function duoNext(){
   var seed = Math.floor( Math.random() * duocount );
   return [seed,duo[seed]];
}
function change(){
   $("#en,#jp").css("display","none");
   var next = duoNext();
   console.log(next[1].en + ":");
   $("#num").html(next[0]);
   $("#en").html(next[1].en);
   $("#jp").html(next[1].jp);
   $("#en").css("display","block");
}
function view(){
   $("#jp").css("display","block");
}
var duocount = 0;
$(function(){
  for(k in duo){
      duocount++;
  }
  change();
});