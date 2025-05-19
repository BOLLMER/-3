<?php
function romanToInt($s) {
    $map = ['I'=>1, 'V'=>5, 'X'=>10, 'L'=>50, 'C'=>100, 'D'=>500, 'M'=>1000];
    $total = 0;
    $prev = 0;
    for ($i = strlen($s) - 1; $i >= 0; $i--) {
        $val = $map[$s[$i]];
        $total += ($val < $prev) ? -$val : $val;
        $prev = $val;
    }
    return $total;
}

echo romanToInt("XVI"); // 16
?>