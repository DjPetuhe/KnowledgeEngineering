(defun replaceAtoB (x)
    (cond
        ((null x) nil)
        ((listp (car x)) (cons (replaceAtoB (car x)) (replaceAtoB (cdr x))))
        (t
            (if (equal (car x) 'a)
                (cons 'b (replaceAtoB (cdr x)))
                (cons (car x) (replaceAtoB (cdr x)))
            )
        )
    )
)

(print (replaceAtoB '((a b) ((c d) (a b c d) ((a (b (c (d e)))))))))