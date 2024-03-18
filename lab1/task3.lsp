(defun fourth-el (lst) (car (cdr (cdr (cdr lst)))))
(defun foruth-el2 (lst) (cadddr lst))

(print (fourth-el '(a b c d e f)))
(print (foruth-el2 '(a b c d e f)))