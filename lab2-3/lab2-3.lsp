;Фрейми людей
(DEFRAMEQ PERSON1
    (INSTANCE ($VALUE (PATIEN1) (WORKER1))) ;Батьківський фрейм для PATIENT1 та WORKER1

    (NAME ($VALUE ("Danile")))
    (SURNAME ($VALUE ("Richardson")))
    (ADRESS ($VALUE ("вул. Грушевскього 22, б. 8")))
    (DOB ($VALUE ("11/09/2002")))
)

(DEFRAMEQ PERSON2
    (INSTANCE ($VALUE (PATIEN2))) ;Батькіскький фрейм для PATIENT2

    (NAME ($VALUE ("Olexander")))
    (SURNAME ($VALUE ("Williams")))
    (ADRESS ($VALUE ("вул. Печерська 22, б. 8")))
    (DOB ($VALUE ("17/11/2002")))
)

;Фрейми пацієнтів
(DEFRAMEQ PATIENT1
    (AKO ($VALUE (PERSON1))) ;Наслідування від PERSON1

    (CARD_NUM ($VALUE (12345678))
        (IF-GETED (PRINT (LIST "ОТРИМАНА КАРТА ПАЦІЄНТА" (FGET PERSON1 NAME) " " (FGET PERSON1 SURNAME))))
    )
)

(DEFRAMEQ PATIENT2
    (AKO ($VALUE (PERSON2))) ;Наслідування від PERSON2

    (CARD_NUM ($VALUE (87654321))
        (IF-GETED (PRINT (LIST "ОТРИМАНА КАРТА ПАЦІЄНТА" (FGET PERSON2 NAME) " " (FGET PERSON2 SURNAME))))
    )
)

;Фрейм працівника
(DEFRAMEQ WORKER1
    (AKO ($VALUE (PERSON1))) ;Наслідування від PERSON1
    (INSTANCE ($VALUE (DOCTOR1))) ;Батьківський клас для DOCTOR1

    (WORK_DEPARTMENT ("Traumotology"))
)

;Фрейм доктора
(DEFRAMEQ DOCTOR1
    (AKO ($VALUE (WORKER1))) ;Наслідування від WORKER1

    (DOCTOR_ID ($VALUE (1)))
    (CABINET_NUM ($VALUE (33)))
    (WORKING_EXPIRIENCE ($VALUE (7)))
    (EDUCATION ($VALUE ("Kiyv Polytecnic Institute")))
    (SPECIALISATION ($VALUE ("Traumotolog")))
    (WORKING_PHONE_NUM ($VALUE ("+380228001337")))
)

;Фрейм прийому
(DEFRAMEQ APPOINTMENT1
    (APP_ID ($VALUE (1)))
    (APP_DATE ($VALUE ("18/03/2024")))
    (APP_TIME ($VALUE ("19:45")))
    (APP_COST ($VALUE (420)))
    
    (APP_DOCTOR ($VALUE (DOCTOR1))
        (IF-ADDED (PRINT (LIST "ДОКТОР ПРИЗНАЧЕНИЙ ДО ПРИЙОМУ " APP_ID)))
        (IF-REMOVED (PRINT (LIST "ДОКТОР ВИДАЛЕНИЙ З ПРИЙОМУ " APP_ID)))
    ) ;Зв'язок з доктором
    (APP_PATIENT ($VALUE (PATIENT2))
        (IF-ADDED (PRINT (LIST "ПАЦІЄНТ ПРИЗНАЧЕНИЙ ДО ПРИЙОМУ " APP_ID)))
        (IF-REMOVED (PRINT (LIST "ПАЦІЄНТ ВИДАЛЕНИЙ З ПРИЙОМУ " APP_ID)))
    ) ;Зв'язок з пацієнтом
)

;Повертає список фреймів, що знаходяться в оперативній пам'яті
(PRINT (*FRAMES*))

;Виводить фрейми в зручному інтерфейсі
(FPRINT PERSON1)
(FPRINT PERSON2)

;Повертає списо імен слотів фрейму
(PRINT (FSLOSTS DOCTOR))

;Видалення та додавання значень
(FDELETE DOCTOR1 WORKING_PHONE_NUM $VALUE "+380228001337")
(FPUT DOCTOR1 WORKING_PHONE_NUM $VALUE "+380133700228")

;Отримання даних
(FGET APPOINTMENT1 APP_DATE)

;Повертає список всіх нащадків фрейму PERSON1
(PRINT (FCHILDREN PERSON1))

;Знаходить відділ в якому відбувався прийом
(PASSERTQ APPOINTMENT_DEPARTMENT (APPOINTMENT)
    (COND
        ((NULL (MEMBER APPOINTMENT (CDR *FRAMES*))) ERROR!_WRONG_APPOINTMENT_NAME!)
        (t (FGET (FGET APPOINTMENT DOCTOR) WORK_DEPARTMENT))
    )
)

;Передбачає яка сума прийому буде для цього пацієнта
(PASSERTQ GET_POSSIBLE_COST (PATIENT)
    (COND 
        ((NULL (MEMBER APPOINTMENT (CDR *FRAMES*))) ERROR!_WRONG_PERSON_NAME!)
        (t ((SETQ RES 420)
            (LOOP FOR INST IN (INSTANCE? (FGET AKO PATIENT)) DO
                (WHEN (FGET WORK_DEPARTMENT)
                    (SETQ RES 0)))
            (RETURN RES))
        )
    )
)

;Повертає загальну ціну яку заплатив цей пацієнт
(PASSERTQ GET_TOTAL_SPENDING (PATIENT)
    (COND
        ((NULL (MEMBER APPOINTMENT (CDR *FRAMES*))) ERROR!_WRONG_APPOINTMENT_NAME!)
        (t ((SETQ SUM 0)
            (LOOP FOR FR IN *FRAMES* DO
                (WHEN (AND (FGET FR APP_COST) (EQUAL (FGET FR APP_PATIENT) PATIENT))
                    (SETQ SUM (+ SUM (FGET FR APP_COST)))))
            (RETURN SUM))
        )
    )
)
