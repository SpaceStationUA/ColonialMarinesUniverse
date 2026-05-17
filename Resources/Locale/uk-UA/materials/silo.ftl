ore-silo-ui-title = Силос матеріалів
ore-silo-ui-label-clients = Машини
ore-silo-ui-label-mats = Матеріали
ore-silo-ui-itemlist-entry = {$linked ->
    [true] {"[Зв'язано] "}
    *[False] {""}
} {$name} ({$beacon}) {$inRange ->
    [true] {""}
    *[false] (Поза зоною досяжності)
}
