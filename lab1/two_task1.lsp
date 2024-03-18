(defun it-pos+ (x) (let ((res '()) (i 0)) (dolist (el x (reverse res)) (push (+ el i) res) (incf i))))

(defun rec-pos+ (x) (labels ((help-rec (x i) (if (null x) '() (cons (+ (car x) i) (help-rec (cdr x) (+ i 1)))))) (help-rec x 0)))

(defun map-pos+ (x) (let ((i -1)) (mapcar #'(lambda (x) (incf i) (+ x i)) x)))

(print (it-pos+ '(7 5 1 4)))
(print (rec-pos+ '(7 5 1 4)))
(print (map-pos+ '(7 5 1 4)))