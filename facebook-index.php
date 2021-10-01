<?php

session_start();

require_once __DIR__ . '/vendor/autoload.php'; // change path as needed

$fb = new Facebook\Facebook([
	'app_id' => '134977392095288',
	'app_secret' => 'f27dc8f13e1fcbaf202c9788b3ebbe64',
	'default_graph_version' => 'v2.10',
]);

$helper = $fb->getRedirectLoginHelper();

$permissions = [ 
	              'email',
	              'pages_read_engagement',
	              'pages_read_user_content',
	              'publish_video',
	              'publish_to_groups'
]; // Optional permissions
$loginUrl = $helper->getLoginUrl('http://localhost/facebooklogin/fb-callback.php', $permissions);

echo '<a href="' . $loginUrl . '">Log in with Facebook!</a>';

?>
