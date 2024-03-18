(defun own-list-to-hash (x &optional (to-hash (make-hash-table)))
    (if (car x)
        (progn
            (setf (gethash (caar x) to-hash) (cdar x))
            (own-list-to-hash (cdr x) to-hash)
        )
        to-hash
    )
)

(defun own-hash-to-list (x)
    (loop for key being the hash-keys in x
        using (hash-value value)
        collect (cons key value))
)

(defvar lst '((k1 . v1) (k2 . v2) (k3 . v3)))

(print lst)
(print (own-list-to-hash lst))
(print (own-hash-to-list (own-list-to-hash lst)))