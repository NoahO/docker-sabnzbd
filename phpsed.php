<?php
    $re = $argv[1];
    $subst = str_replace("\\n", "\n", $argv[2]);
    $str = file_get_contents($argv[3]);

    $result = preg_replace($re, $subst, $str);
    file_put_contents($argv[3], $result);
?>