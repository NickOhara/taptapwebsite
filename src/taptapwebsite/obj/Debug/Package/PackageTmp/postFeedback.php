<?php
	/* For information and assistance, visit http://cbsmth.se/web-development/tinyfeedback/ */
	/* Configuration */
	$deliveryMethod = 1; // 1 - Mail, 2 - Database, 3 - Textfile
	$myEmail = 'foo@bar.com';
	$mailTitle = '[tinyFeedback] User Feedback';
	$textFile = 'tinyFeedback.txt';
	// Configure the $query at line 40
	//$db = mysql_connect('host', 'username', 'password');
	//mysql_select_db('database_name');
	$msgSuccess = '<h2>Thank you for contributing!</h2><p>Your feedback has been received and will be taken into consideration.</p>';
	$msgDeliveryFailure = '<h2>Something went wrong...</h2><p>The delivery method encountered an error. Your feedback has not been delivered.</p>';
	$errors = '';

	if(preg_match("/[\r\n]/", $_POST['email'])) { /* Check for injection attempts */
		$errors .= '<li>Malformed data in e-mail field</li>';
	}
	if(empty($_POST['feedback'])) {
		$errors .= '<li>You did not provide any feedback</li>';
	} else {
		$_POST['feedback'] = 'Date: ' . date('Y-m-d H:i') . PHP_EOL . 'Page: ' . $_SERVER['HTTP_REFERER'] . PHP_EOL . 'User: ' . $_POST['email'] . PHP_EOL . '---' . PHP_EOL . $_POST['feedback'] . PHP_EOL . PHP_EOL;
	}
	if(!empty($errors)) {
		die('<h2>Something went wrong...</h2><ul>' . $errors . '</ul>');
	}

	/* Delivery methods */

	if($deliveryMethod == 1) {
		/* Pass feedback as e-mail */
		if(mail($myEmail, '[tinyFeedback] User Feedback', $_POST['feedback'], 'From: ' . $_POST['email'] . PHP_EOL)) {
			echo $msgSuccess;
		} else {
			echo $msgDeliveryFailure;
		}
	} else if($deliveryMethod == 2) {
		/* Save feedback to a database
		 * Alter the query to suit your needs */
		if(isset($db)) {
			//$query = 'INSERT INTO table_name (column1, column2) VALUES(...)';
			if(mysql_query($query, $db)) {
				echo $msgSuccess;
			} else {
				echo $msgDeliveryFailure;
			}
		} else {
			echo $msgDeliveryFailure;
		}
	} else if($deliveryMethod == 3) {
		/* Append feedback to text file - Make sure it exists and that we have write privileges */
		if(fwrite(fopen($textFile, 'a'), $_POST['feedback'])) {
			echo $msgSuccess;
		} else {
			echo $msgDeliveryFailure;
		}
	} else {
		die('<h2>Something went wrong...</h2><p>Delivery method misconfiguration.</p>');
	}
?>
