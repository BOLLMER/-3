<?php
function reverseNumber($num) {
    return (int)strrev((string)$num);
}

$n = intval(fgets(STDIN)); // Вводим количество чисел
$prev = intval(fgets(STDIN)); // Вводим первое число
$result = [];

for ($i = 1; $i < $n; $i++) {
    $current = intval(fgets(STDIN)); // Вводим следующее число
    if ($current < $prev) {
        array_unshift($result, reverseNumber($prev)); // Добавляем в начало
    }
    $prev = $current; // Обновляем предыдущее число
}

array_unshift($result, reverseNumber($prev)); // Добавляем последнее число

// Переворачиваем массив и выводим
echo implode(' ', array_reverse($result));
?>