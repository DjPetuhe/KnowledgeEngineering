(defun showdots (x) (if (null (car x)) (format t "NIL") (progn (format t "(~a . " (car x)) (showdots (cdr x)) (format t ")"))))

(showdots '(1 2 3 4))