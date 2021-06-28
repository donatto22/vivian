//prevent the user see the code
/*onkeydown = e => {
	let tecla = e.which || e.keyCode;
	
	if ( e.ctrlKey ) {
		if ( tecla === 85 || tecla === 83 || tecla === 16 || tecla === 73 || tecla === 63 || tecla === 67 || tecla === 123) {
			e.preventDefault();
			e.stopPropagation();	
		}
	}
} */

//fake fast ajax
$(document).ready(function() {

	$('#creadores').on('click', function() {
		
		$('body, html').animate({
			scrollTop : '0px'
		}, 050);

		$("#central").load('/vivian/content/html/creadores.html').hide().fadeIn();
		return false;
	});

	$('#loginRegistro').on('click', function() {

		$('body, html').animate({
			scrollTop : '0px'
		}, 050);

		$("#central").load('/vivian/content/jsp/login.jsp').hide().fadeIn();
		return false;
	});

	$('#usuario').on('click', function() {
				
		$('body, html').animate({
			scrollTop : '0px'
		}, 050);

		$("#central").load('/vivian/content/jsp/user.jsp').hide().fadeIn();
		return false;
	});
	
	$('#reservas').on('click', function() {
		window.location.href = "/vivian/content/jsp/reservas.jsp";
		return false;
	});
});

// dropdown
function drop1() {
	document.getElementById("drop1").classList.toggle("show");
}

window.onclick = function(event) {
	if (!event.target.matches('.dropbtn')) {
		var dropdowns = document.getElementsByClassName("dropdown-content");
		var i;
							
		for (i = 0; i < dropdowns.length; i++) {
			var openDropdown = dropdowns[i];
								
			if (openDropdown.classList.contains('show')) {
				openDropdown.classList.remove('show');
			}
		}
	}
}

function drop2() {
	document.getElementById("drop2").classList.toggle("show");
}

window.onclick = function(event) {
	if (!event.target.matches('.dropbtn')) {
		var dropdowns = document.getElementsByClassName("dropdown-content");
		var i;
							
		for (i = 0; i < dropdowns.length; i++) {
			var openDropdown = dropdowns[i];
								
			if (openDropdown.classList.contains('show')) {
				openDropdown.classList.remove('show');
			}
		}
	}
}

function drop3() {
	document.getElementById("drop3").classList.toggle("show");
}

window.onclick = function(event) {
	if (!event.target.matches('.dropbtn')) {
		var dropdowns = document.getElementsByClassName("dropdown-content");
		var i;
							
		for (i = 0; i < dropdowns.length; i++) {
			var openDropdown = dropdowns[i];
								
			if (openDropdown.classList.contains('show')) {
				openDropdown.classList.remove('show');
			}
		}
	}
}