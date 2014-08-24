<?php
$clientName = $_POST['clientName'];

// Quick and dirty sanitization
$clientName = preg_replace('/[^\da-z ]/i', '', $clientName);

$cmd = "/scripts/update-app-config.sh " . escapeshellarg($clientName);
exec($cmd);

?>

Configuration complete!
<p></p>

<a href="/">Go to the application</a>


<iframe style="display: none;" src="restore-proxy.php"></iframe>
