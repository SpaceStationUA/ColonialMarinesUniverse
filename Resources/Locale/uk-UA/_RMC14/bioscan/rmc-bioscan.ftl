rmc-bioscan-ares-announcement = [color=white][font size=16][bold]APOLLO MK.II - Статус біосканування[/bold][/font][/color][color=red][font size=14][bold]
    {$message}[/bold][/font][/color]

rmc-bioscan-ares = Біосканування завершено.

  Сенсори виявили { $shipUncontained ->
    [0] жодної
    *[other] {$shipUncontained}
  } невідомої форми життя { $shipUncontained ->
    [0] сигнатур
    [1] сигнатуру
    [2] сигнатури
    [3] сигнатури
    [4] сигнатури
    *[other] сигнатур
  } на кораблі{ $shipLocation ->
    [none] {""}
    *[other], включаючи одну в {$shipLocation},
  } та { $onPlanet ->
    [0] жодної
    *[other] приблизно {$onPlanet}
  } { $onPlanet ->
    [0] сигнатур
    [1] сигнатуру
    [2] сигнатури
    [3] сигнатури
    [4] сигнатури
    *[other] сигнатур
  } в іншому місці{ $planetLocation ->
    [none].
    *[other], включаючи одну в {$planetLocation}
  }

rmc-bioscan-xeno-announcement = [color=#318850][font size=14][bold]Королева-Мати торкається вашого розуму з далеких світів.
   {$message}[/bold][/font][/color]

rmc-bioscan-xeno = До моїх дітей та їхньої Королеви: я відчуваю { $onShip ->
    [0] жодного носія
    [1] приблизно 1 носія
    *[other] приблизно {$onShip} носіїв
  } у металевому вулику{ $shipLocation ->
    [none] {""}
    *[other], зокрема одного в {$shipLocation},
  } і { $onPlanet ->
    [0] нікого
    *[other] {$onPlanet}
  } деінде{$planetLocation ->
    [none].
    *[other], зокрема одного в {$planetLocation}
  }
