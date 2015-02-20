// tinyFeedback by Fredrik Karlstrom
// For information and assistance: http://cbsmth.se/web-development/tinyfeedback/

function tinyFeedback(target) {
	var cont = $('<div/>', { html: '<p>Did you find what you were looking for?</p>', 'id': 'tinyFeedback'});
	var btnYes = $('<a/>', { html: '+ Yes', 'id': 'yes', click: function() { feedbackYes(cont); } }).appendTo(cont);
	var btnNo = $('<a/>', { html: '- No', 'id': 'no', click: function() { feedbackNo(cont); } }).appendTo(cont);
	cont.appendTo(target);

	function feedbackYes(cont) {
		// Track positive feedback in GA
		_gaq.push(['_trackEvent', 'Feedback', 'Positive', document.location.href]);
		cont.html('<p>Thank you for your input!</p>').delay(1000).fadeOut('slow', function() { cont.remove(); });
	}

	function feedbackNo(cont) {
		// Track negative feedback in GA
		_gaq.push(['_trackEvent', 'Feedback', 'Negative', document.location.href]);
		var lb_overlay = $('<div/>', { 'id': 'lb_overlay' });
		var closelink = $('<a/>', { html: 'X', 'id': 'lb_close', click: function() { removeLB(); } });
		var lb_cont = $('<div/>', { html: closelink, 'id': 'tinyFeedbackNegative' });
		var lb_text = $('<div/>', { html: '<h2>Care to elaborate?</h2><p>Thank you, your feedback has been registered! Mind telling us what we could do better?</p><p>Fill out the form to the right, and we will do our best to take your opinions into consideration henceforth.</p><p><strong>Thank you for helping us improve!</strong></p><p><em>- Signature or team name here</em></p>', 'id': 'tinyFeedbackNegativeText' });
		var form = $('<form/>', { html: '<h3>Your Feedback</h3><input type="text" name="email" id="email" placeholder="Your e-mail (not required)" tabindex="1"><textarea name="feedback" id="feedback" placeholder="Please tell us how to improve our service." tabindex="2"></textarea><input type="submit" id="btn_sendfeedback" value="Send Feedback" tabindex="3">', 'action': '#', 'method': 'post', 'id': 'tinyFeedbackForm' });

		$(document).keydown(function(e) {
			if(e.which == 27) {
				removeLB();
			}
		});

		function removeLB() {
			lb_cont.fadeOut('fast', function() {
				lb_cont.remove();
				lb_overlay.remove();
			});
		}

		form.submit(function(event) {
			event.preventDefault();
			if(event.target[1].value != '') {
				// Please verify that this path is correct. 
				$.post('/tinyFeedback/postFeedback.php', { 'email': event.target[0].value, 'feedback': event.target[1].value }, function(data) {
					lb_text.html(data);
					lb_cont.delay(2000).fadeOut('slow', function() { 
						lb_cont.remove(); 
						lb_overlay.remove();
						cont.html('<p>Thank you for your input!</p>').delay(1000).fadeOut('slow', function() { cont.remove(); });
					});
				});
			}
		});

		$('body').append(lb_overlay);
		lb_text.appendTo(lb_cont);
		form.appendTo(lb_cont);
		lb_cont.appendTo($('body'));
		lb_cont.fadeIn('slow');
		$('#feedback').focus();
	}
}
