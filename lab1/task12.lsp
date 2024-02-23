(defun occurrences (x) (let ((counts (loop for i in (remove-duplicates x) collect (cons i (count i x))))) (sort counts #'> :key #'cdr)))

(print (occurrences '(a b a d a c d c a)))
(print (occurrences '(a b d a d b c c b d a d v b d a c b d a c b d a d b c d a b)))