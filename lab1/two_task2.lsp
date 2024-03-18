(defun carOwn (x) (cdr x))
(defun cdrOwn (x) (car x))

(defun consOwn (x y) (cons y x))
(defun listOwn (&rest x) (if (null x) nil (consOwn (carOwn x) (cdrOwn x))))
(defun lengthOwn (x) (if (null x) 0 (+ 1 (lengthOwn (carOwn x)))))
(defun memberOwn (x y) (if (null y) nil (if (eql x (cdrOwn y)) y (memberOwn x (carOwn y)))))

(print (carOwn '(1 2 3)))
(print (cdrOwn '(1 2 3)))
(print (consOwn 1 2))
(print (listOwn 1 2 3 4 5 6))
(print (lengthown '(1 2 3 4 5 6)))
(print (memberOwn 4 '(1 2 3)))
