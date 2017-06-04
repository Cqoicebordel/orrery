<?php
$json = file_get_contents('http://www.howmanypeopleareinspacerightnow.com/peopleinspace.json');
$obj = json_decode($json);
echo $obj->number;
?>
