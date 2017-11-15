<?php
if (time() - filemtime("stats.html") > 1 * 3600)
    exec("./analyze_hdb_logs");

echo file_get_contents("stats.html");

