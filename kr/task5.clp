(deftemplate profession
    (slot p)
)

(deftemplate smallest
    (slot isSmallest)
)

(deftemplate sibling
    (slot haveSiblings)
)

(deffacts professions
    (profession (p "Slesar"))
    (profession (p "Tokar"))
    (profession (p "Svarshchuk"))

    (smallest (isSmallest 0))
    (smallest (isSmallest 1))

    (sibling (haveSiblings 0))
    (sibling (haveSiblings 1))
)

(defrule PersonsProfessions
    (profession (p ?professionI))
    (profession (p ?professionB))
    (profession (p ?professionS))
    (smallest (isSmallest ?smallestI))
    (smallest (isSmallest ?smallestB))
    (smallest (isSmallest ?smallestS))
    (sibling (haveSiblings ?haveSiblingsI))
    (sibling (haveSiblings ?haveSiblingsB))
    (sibling (haveSiblings ?haveSiblingsS))

    (test
        (and
            (neq ?professionI ?professionB)
            (neq ?professionI ?professionS)
            (neq ?professionB ?professionS)
        )
    )

    ;Слюсар не має ні братів, ні сестер. Він наймолодший із друзів.
    (test
        (or
            (and (eq (str-compare ?professionI "Slesar") 0) (eq ?haveSiblingsI 0) (eq ?smallestI 1) (eq ?smallestB 0) (eq ?smallestS 0))
            (and (eq (str-compare ?professionB "Slesar") 0) (eq ?haveSiblingsB 0) (eq ?smallestI 0) (eq ?smallestB 1) (eq ?smallestS 0))
            (and (eq (str-compare ?professionS "Slesar") 0) (eq ?haveSiblingsS 0) (eq ?smallestI 0) (eq ?smallestB 0) (eq ?smallestS 1))
        )
    )

    ;Семененко, одружений із сестрою Борисенко, старший за токаря
    (test
        (and
            (eq ?smallestS 0)
            (eq ?haveSiblingsB 1)
            (neq (str-compare ?professionS "Tokar") 0)
        )
    )

    =>
    (printout t crlf "Ivanov: " ?professionI ", Borysenko: " ?professionB ", Semenenko: " ?professionS "." crlf)
)