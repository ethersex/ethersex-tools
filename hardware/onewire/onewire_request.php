<html>
<head>
<title>ethersex php example</title>
</head>
<body>
<?php
$IP='192.168.0.89'; // deine ethersex ip adresse
$PORT=2701; // standard port im image
request($IP, $PORT, "1w convert");
$response = request($IP, $PORT, "1w list");
$explode = explode("\n", $response);
for ($i=0; $i < count($explode)-2; $i++) {
  echo "Sensor: " . trim($explode[$i]);
  echo " -- Wert: " . request($IP, $PORT, "1w get " . $explode[$i]);
  echo "<br>\n";
}
function request($ip, $port, $request) {
  $rs = fsockopen($ip, $port);
  if (!$rs) {
    $response  = "Kann Verbindung nicht aufbauen!";
  }
  else {
    $response ="";
    $request = "!" . $request . "\r\n";
    fputs($rs, $request);
    while (!feof($rs)) {
      $response .= fgets($rs, 128);
    }
    fclose($rs);
  }
  return $response;
}
?>
</body>
