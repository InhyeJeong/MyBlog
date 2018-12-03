<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="icon" required="false" type="String" %>
<%@ attribute name="title" required="true" type="String" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<h2 class="ml3 my-5" style="font-style:italic; color:gray;">
	<i class="fas fa-list"></i>${title}</h2>
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>

<style>
	.ml3 {
	  font-weight: 900;
	  font-size: 3.5em;
	}
</style>

<script>
	//Wrap every letter in a span
	$('.ml3').each(function(){
	  $(this).html($(this).text().replace(/([^\x00-\x80]|\w)/g, "<span class='letter'>$&</span>"));
	});
	
	anime.timeline({loop: true})
	  .add({
	    targets: '.ml3 .letter',
	    opacity: [0,1],
	    easing: "easeInOutQuad",
	    duration: 2250,
	    delay: function(el, i) {
	      return 150 * (i+1)
	    }
	  }).add({
	    targets: '.ml3',
	    opacity: 0,
	    duration: 1000,
	    easing: "easeOutExpo",
	    delay: 1000
	  });
</script>
