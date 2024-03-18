(defun quarter-turn (arr)
    (let* ((i_max (array-dimension arr 0)) (j_max (array-dimension arr 1)) (rotated_matrix (make-array (list j_max i_max))))
        (dotimes (i i_max)
            (dotimes (j j_max)
                (setf (aref rotated_matrix j (- i_max i 1)) (aref arr i j))
            )
        )
        rotated_matrix
    )
)

(print (quarter-turn #2A((a b) (c d))))
(print (quarter-turn #2A((1 2 3 4 5) (6 7 8 9 10) (11 12 13 14 15))))