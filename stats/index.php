<?php

if (!file_exists("stats.html") || time() - filemtime("stats.html") > 3600) {
    echo shell_exec("./analyze_hdb_logs 2>&1");
}

if (file_exists("stats.html"))
    echo file_get_contents("stats.html");
else
    echo "script didn't run. fix it.";

