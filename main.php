<?php
function count_trailing_zeros($n) {
    $count = 0;
    for ($i = 5; $n / $i >= 1; $i *= 5) {
        $count += intval($n / $i);
    }
    return $count;
}

echo "Введите число N: ";
$n = intval(trim(fgets(STDIN)));
echo "Количество конечных нулей в N!: " . count_trailing_zeros($n) . "\n";
?>