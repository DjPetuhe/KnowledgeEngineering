(defun containsList (x) (and (not (null x)) (or (listp (car x)) (containsList (cdr x)))))

(print (containslist '(1 2 3 4 5)))
(print (containslist '()))
(print (containslist nil))
(print (containslist '(1 2 (1 2) 4 5)))
(print (containslist '(1 2 (1) 4 5))
(print (containslist '(1 2 () 4 5))))
(print (containslist '(1 2 3 4 ())))