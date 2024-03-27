(defrule data-input
    (initial-fact)
    =>
    (printout t crlf "Enter age: ")
    (bind ?age (read))
    (assert (age ?age))
    (printout t crlf "Enter sex (m/f): ")
    (bind ?sex (read))
    (assert (sex ?sex))
    (printout t crlf "Enter the presence of arterial hypertension (yes - 1/no - 0): ")
    (bind ?hypertension (read))
    (printout t crlf "Enter your cholesterol level (high - 1/normal - 0): ")
    (bind ?cholesterol (read))
    (printout t crlf "Enter whether you smoke (yes - 1/no - 0): ")
    (bind ?smoking (read))
    (printout t crlf "Enter presence of diabetes (yes - 1/no - 0): ")
    (bind ?diabetes (read))
    (printout t crlf "Do you feel chest pain? (yes - 1/no - 0): ")
    (bind ?chest-pain (read))
    (printout t crlf "Do you feel shortness of breath? (yes - 1/no - 0): ")
    (bind ?shortness-of-breath (read))
    (printout t crlf "Do you feel nausea? (yes - 1/no - 0): ")
    (bind ?nausea (read))
    (printout t crlf "Do you feel weakness? (yes - 1/no - 0): ")
    (bind ?weakness (read))
    (assert (predispositions (create$ ?hypertension ?cholesterol ?smoking ?diabetes)))
    (assert (symptoms (create$ ?chest-pain ?shortness-of-breath ?nausea ?weakness)))
)

(defrule define-risk-age1
    (age ?age)
    (sex ?sex)
    (test (or (and (eq (str-compare ?sex "m") 0) (>= ?age 45)) (and (eq (str-compare ?sex "f") 0) (>= ?age 55))))
    =>
    (printout t crlf "Your age is at high risk. " crlf)
    (assert (risk-age 1))
)

(defrule define-risk-age2
    (age ?age)
    (sex ?sex)
    (test (or (and (eq (str-compare ?sex "m") 0) (< ?age 45)) (and (eq (str-compare ?sex "f") 0) (< ?age 55))))
    =>
    (printout t crlf "Your age is not at risk. " crlf)
    (assert (risk-age 0))
)

(defrule count-predispositions
    (predispositions $?predispositions)
    =>
    (bind ?count 0)
    (foreach ?item ?predispositions
        (if (eq ?item 1) then
            (bind ?count (+ ?count 1))
        )
    )
    (if (>= ?count 3)
        then
        (printout t crlf "You have high predisposition to infarftion." crlf)
        (assert (predisposition 2))
        else
        (if (>= ?count 1)
            then
            (printout t crlf "You have average predisposition to infarction." crlf)
            (assert (predisposition 1))
            else
            (printout t crlf "You dont have any predisposition to infarction." crlf)
            (assert (predisposition 0))
        )
    )
)

(defrule count-symptoms
    (symptoms $?symptoms)
    =>
    (bind ?count 0)
    (foreach ?item ?symptoms
        (if (eq ?item 1) then
            (bind ?count (+ ?count 1))
        )
    )
    (if (>= ?count 3)
        then
        (printout t crlf "You have very similar symptoms to infarftion." crlf)
        (assert (symptom 2))
        else
        (if (>= ?count 1)
            then
            (printout t crlf "You have similar symptoms to infarction." crlf)
            (assert (symptom 1))
            else
            (printout t crlf "You dont have any infarction symptoms." crlf)
            (assert (symptom 0))
        )
    )
)

(defrule R1
    (risk-age ?risk-age)
    (predisposition ?predisposition)
    (symptom ?symptom)
    (test (and (= ?risk-age 0)
               (or (and (= ?predisposition 0) (= ?symptom 0))
                   (and (= ?predisposition 0) (= ?symptom 1))
                   (and (= ?predisposition 1) (= ?symptom 0)))))
    =>
    (printout t crlf "You are young and healthy enough, so no need to worry." crlf)
)

(defrule R2
    (risk-age ?risk-age)
    (predisposition ?predisposition)
    (symptom ?symptom)
    (test (and (eq (= ?risk-age 1) 0) (eq (= ?predisposition 0) 0) (eq (= ?symptom 0) 0)))
    =>
    (printout t crlf "You are not young, but u have perfect health, so no need to worry." crlf)
)


(defrule R3
    (risk-age ?risk-age)
    (predisposition ?predisposition)
    (symptom ?symptom)
    (test (and (= ?risk-age 0)
               (or (and (= ?predisposition 1) (= ?symptom 1))
                   (and (= ?predisposition 2) (= ?symptom 1))
                   (and (= ?predisposition 1) (= ?symptom 2))
                   (and (= ?predisposition 0) (= ?symptom 2))
                   (and (= ?predisposition 2) (= ?symptom 0)))))
    =>
    (printout t crlf "You are young but not so healthy, so you should visit a doctor." crlf)
)


(defrule R4
    (risk-age ?risk-age)
    (predisposition ?predisposition)
    (symptom ?symptom)
    (test (and (= ?risk-age 1)
               (or (and (= ?predisposition 0) (= ?symptom 1))
                   (and (= ?predisposition 1) (= ?symptom 0))
                   (and (= ?predisposition 1) (= ?symptom 1))
                   (and (= ?predisposition 0) (= ?symptom 2))
                   (and (= ?predisposition 2) (= ?symptom 0)))))
    =>
    (printout t crlf "You are neither young nor healthy, so you should visit a doctor." crlf)
)

(defrule R5
    (risk-age ?risk-age)
    (predisposition ?predisposition)
    (symptom ?symptom)
    (test (and (= ?risk-age 0) (= ?predisposition 2) (= ?symptom 2)))
    =>
    (printout t crlf "You are young, but your predisposition and symptoms are horrible! Call emergency!" crlf)
)


(defrule R6
    (risk-age ?risk-age)
    (predisposition ?predisposition)    
    (symptom ?symptom)
    (test (and (= ?risk-age 1)
               (or (and (= ?predisposition 1) (= ?symptom 2))
                   (and (= ?predisposition 2) (= ?symptom 1))
                   (and (= ?predisposition 2) (= ?symptom 2)))))
    =>
    (printout t crlf "You are not young and your predisposition and symptoms are horrible! Call emergency!" crlf)
)