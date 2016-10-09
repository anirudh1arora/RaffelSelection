
$(function() {
$("#panel-div").tabs();

$( "#logo" ).tooltip({
    items: "img",
    content: function() {
    var element = $( this );
   
    if ( element.is( "img" ) ) {
       return element.attr( "alt" );
    }
   }
  });
});
 