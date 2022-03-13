interface Option
    exposes [
        Option,
        isSome,
        isNone,
        map,
        andThen,
        or,
        orElse,
        unwrapOr,
        unwrapOrElse,
        filter,
        flatten,
        toList,
    ]
    imports []

Option t : [ None, Some t ]

isSome : Option a -> Bool
isSome = \o ->
    when o is
        None -> False
        Some _ -> True

isNone : Option a -> Bool
isNone = \o -> !(isSome o)

map : Option a, (a -> b) -> Option b
map = \o, f ->
    when o is
        None -> None
        Some a -> Some (f a)

andThen : Option a, (a -> Option b) -> Option b
andThen = \o, f ->
    when o is
        None -> None
        Some a -> f a

or : Option a, Option a -> Option a
or = \o, els ->
    if isNone o then
        els
    else
        o

orElse : Option a, (_ -> Option a) -> Option a
orElse = \o, els ->
    if isNone o then
        els {}
    else
        o

unwrapOr : Option a, a -> a
unwrapOr = \o, els ->
    when o is
        Some a -> a
        None -> els

unwrapOrElse : Option a, (_ -> a) -> a
unwrapOrElse = \o, els ->
    when o is
        Some a -> a
        None ->
            res = els {}
            res

filter : Option a, (a -> Bool) -> Option a
filter = \o, f ->
    when o is
        None -> None
        Some a ->
            if f a then
                Some a
            else
                None

flatten : Option (Option a) -> Option a
flatten = \o ->
    when o is
        None -> None
        Some None -> None
        Some (Some a) -> Some a

toList : Option a -> List a
toList = \o ->
    when o is
        None -> [ ]
        Some a -> [ a ]

