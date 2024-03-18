(defun own-copy-list (x) (reduce #'cons x :from-end t :initial-value nil))

(print (own-copy-list '(1 2 3 4 5 6)))

(defun own-reversed (x) (reduce #'(lambda (x y) (cons y x)) x :initial-value nil))

(print (own-reversed '(1 2 3 4 5 6)))