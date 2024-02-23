(defun printDots (x) (loop for i from 1 to x do (princ #\.) finally (terpri)))

(printDots 2)
(printDots 5)

(defun printDotsRec (x) (if (eql x 0) (terpri) (progn (princ #\.) (printdotsrec (- x 1)))))

(printDotsRec 2)
(printDotsRec 5)

(defun calcCount (x) (let ((cnt 0)) (loop for i in x do (incf cnt) finally (return-from calccount cnt))))

(print (calcCount '(1 2 3 4 5 6 7)))
(print (calcCount '(a b c d)))

(defun calcCountRec (x) (if x (+ (calcCountRec (cdr x)) 1) 0))

(print (calcCountRec '(1 2 3 4 5 6 7)))
(print (calcCountRec '(a b c d)))