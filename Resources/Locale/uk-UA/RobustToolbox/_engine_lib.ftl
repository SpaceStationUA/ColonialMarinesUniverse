# Використовується внутрішньо функцією THE().
# В українській артиклів немає, тому просто повертаємо назву сутності.
zzzz-the = { $ent }

# Використовується внутрішньо функцією SUBJECT() — займенник у називному відмінку (хто? що?).
zzzz-subject-pronoun = { GENDER($ent) ->
    [male] він
    [female] вона
    [epicene] вони
   *[neuter] воно
   }

# Використовується внутрішньо функцією OBJECT() — займенник у знахідному відмінку (кого? що?).
zzzz-object-pronoun = { GENDER($ent) ->
    [male] його
    [female] її
    [epicene] їх
   *[neuter] його
   }

# Використовується внутрішньо функцією DAT-OBJ() — займенник у давальному відмінку (кому? чому?).
zzzz-dat-object = { GENDER($ent) ->
    [male] йому
    [female] їй
    [epicene] їм
   *[neuter] йому
   }

# Використовується внутрішньо функцією GENITIVE() — займенник у родовому відмінку (кого? чого?).
zzzz-genitive = { GENDER($ent) ->
    [male] його
    [female] її
    [epicene] їх
   *[neuter] його
   }

# Використовується внутрішньо функцією POSS-PRONOUN() — присвійний займенник, що стоїть самостійно ("це його").
zzzz-possessive-pronoun = { GENDER($ent) ->
    [male] його
    [female] її
    [epicene] їхній
   *[neuter] його
   }

# Використовується внутрішньо функцією POSS-ADJ() — присвійний прикметник перед іменником ("його книга").
zzzz-possessive-adjective = { GENDER($ent) ->
    [male] його
    [female] її
    [epicene] їхній
   *[neuter] його
   }

# Використовується внутрішньо функцією REFLEXIVE() — зворотний займенник ("сам себе").
zzzz-reflexive-pronoun = { GENDER($ent) ->
    [male] себе
    [female] себе
    [epicene] себе
   *[neuter] себе
   }

# Використовується внутрішньо функцією CONJUGATE-BE().
# В українській "є" однакове для всіх родів і чисел у теперішньому часі.
zzzz-conjugate-be = { GENDER($ent) ->
    [epicene] є
   *[other] є
   }

# Використовується внутрішньо функцією CONJUGATE-HAVE() — "має" для однини, "мають" для множини.
zzzz-conjugate-have = { GENDER($ent) ->
    [epicene] мають
   *[other] має
   }

# Використовується внутрішньо функцією CONJUGATE-BASIC().
zzzz-conjugate-basic = { GENDER($ent) ->
    [epicene] { $first }
   *[other] { $second }
   }
