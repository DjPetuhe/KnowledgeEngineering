(defstruct ownBST left_child right_child data)

(defun bst-adjoin1 (x y)
    (if y
        (cond
            ((null (ownBST-data y)) (setf (ownBST-data y) x))
            ((< x (ownBST-data y)) (progn (setf (ownBST-left_child y) (bst-adjoin1 x (ownBST-left_child y)))  y))
            ((> x (ownBST-data y)) (progn (setf (ownBST-right_child y) (bst-adjoin1 x (ownBST-right_child y)))  y))
            (t y)
        )
        (make-ownBST :data x)
    )
)

(defun own-bst-to-list (x)
    (if x (append (own-bst-to-list (ownBST-right_child x)) (list (ownBST-data x)) (own-bst-to-list (ownBST-left_child x))))
)

(defvar bst (make-ownBST))

(bst-adjoin1 10 bst)
(bst-adjoin1 5 bst)
(bst-adjoin1 15 bst)
(bst-adjoin1 2 bst)
(bst-adjoin1 16 bst)
(bst-adjoin1 20 bst)

(print bst)
(print (own-bst-to-list bst))