(defstruct ownTree first_child second_child third_child data)

(defun own_copy_tree (x) (if x (make-ownTree :first_child (ownTree-first_child x)
                                             :second_child (ownTree-second_child x)
                                             :third_child (ownTree-third_child x)
                                             :data (ownTree-data x))))

(defun own_find_in_tree (x y) (if y (or (eql x (ownTree-data y))
                                         (own_find_in_tree x (ownTree-first_child y))
                                         (own_find_in_tree x (ownTree-second_child y))
                                         (own_find_in_tree x (ownTree-third_child y)))))

(defvar tr (make-ownTree :first_child (make-ownTree :data 'b)
                         :second_child (make-ownTree :data 'c)
                         :third_child (make-ownTree :data 'd)
                         :data 'a))

(defvar copy-tr (own_copy_tree tr))

(print tr)
(print copy-tr)
(print (own_find_in_tree 'd tr))
(print (own_find_in_tree 'a copy-tr))
(print (own_find_in_tree 'g tr))
(print (own_find_in_tree 'l copy-tr))