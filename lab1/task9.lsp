(defun summit (lst) (apply #'+ (remove nil lst)))

(print (summit '(nil 1 nil 1 nil 5 nil)))

(defun summit2 (lst) (if (null lst) 0 (let ((x (car lst))) (if (null x) (summit2 (cdr lst)) (+ x (summit2 (cdr lst)))))))

(print (summit2 '(nil 1 nil 1 nil 5 nil)))