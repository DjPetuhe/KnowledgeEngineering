(defun printDots (x) (loop for i from 1 to x do (princ #\.) finally (terpri)))

(printDots 2)
(printDots 5)

(defun printDotsRec (x) (if (eql x 0) (terpri) (progn (princ #\.) (printdotsrec (- x 1)))))

(printDotsRec 2)
(printDotsRec 5)

(defun calcCount (x y) (let ((cnt 0)) (loop for i in y do (if (eql i x) (incf cnt)) finally (return cnt))))

(print (calcCount 'a '(1 2 3 4 5 6 7)))
(print (calcCount 'a '(a b c a d a)))

(defun calcCountRec (x y) (if y (if (eql (car y) x) (+ (calcCountRec x (cdr y)) 1) (calcCountRec x (cdr y))) 0))

(print (calcCountRec 'a '(1 2 3 4 5 6 7)))
(print (calcCountRec 'a '(a b c a d a)))