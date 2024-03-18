(print (eql '(a) '(a)))
(print (equal '(a) '(a)))

(print (member '(a) '((a) (b))))
(print (member '(a) '((a) (b)) :test #'equal))