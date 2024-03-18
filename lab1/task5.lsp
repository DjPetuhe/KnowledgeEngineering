(defun enigma (x) (and (not (null x)) (or (null (car x)) (enigma (cdr x)))))

(defun mystery (x y) (if (null y) nil (if (eql (car y) x) 0 (let ((z (mystery x (cdr y)))) (and z (+ z 1))))))

(print (enigma '(1 2 3 4)))
(print (enigma '(1 Nil 2 3)))
(print (enigma '(1 2 3 Nil)))
(print (enigma '(1 () 2 3)))
(print (enigma '(1 2 3 ())))

(print (mystery 1 '(1 2 2)))
(print (mystery 1 '(2 1 2)))
(print (mystery 1 '(2 2 1)))
(print (mystery 1 '(2 2 2)))